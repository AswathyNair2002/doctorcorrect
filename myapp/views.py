import re
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
import MySQLdb
from django.core.files.storage import FileSystemStorage

db=MySQLdb.connect(host="localhost",user="root",password="Aswathy@123",database="dbdoctorcorrect") 
c=db.cursor()
# Create your views here.
def home (request):
    return render (request,"home.html")

def about (request):
    return render (request,"about.html")

def blog_details (request):
    return render (request,"blog_details.html")

def contact (request):
    return render (request,"contact.html")

def login1 (request):
   
    msg=""
    if(request.POST):
        email=request.POST.get("uname")
        pwd=request.POST.get("psw")
        s="select count(*) from tbllogin where username='"+email+"'"
        c.execute(s)
        i=c.fetchone()
        if(i[0]>0):
            s="select * from tbllogin where username='"+email+"'"
            print(s)
            c.execute(s)
            i=c.fetchone()
            if(i[1]==pwd):
                request.session['email'] = email
                if(i[3]=="1"):
                    if(i[2]=="admin"):
                        return HttpResponseRedirect("/adminhome")
                    elif(i[2]=="patient"):
                        return HttpResponseRedirect("/patienthome")
                    elif(i[2]=="doctor"):
                        s="select * from doctorregistration  where email='"+email+"'"
                        print(s)
                        c.execute(s)
                        i=c.fetchone()
                        request.session['name']=i[1]
                        return HttpResponseRedirect("/doctorhome")
                elif(i[3]=="inactive"):
                    msg="Your registration is incomplete. Please register"
                else:
                    msg="You are not authenticated to login"
            else:
                msg="Incorrect password"
        else:
            msg="User doesnt exist"
    return render(request,"login1.html",{"msg":msg})

def admindepartment(request):
    msg=""
    if request.POST:
        location=request.POST['txtLocation']
        s=f"select count(*) from tbldepartment where dep='{location}'"
        c.execute(s)
        d=c.fetchone()
        if d[0]>0:
            msg="Already exist"
        else:
            s=f"insert into tbldepartment(dep) values('{location}')"
            try:
                c.execute(s)
                db.commit()
            except:
                msg="Sorry some error occured"
            else:
                msg="Category added"
    data=loadcategory()
    return render(request,"admindepartment.html",{"data":data,"msg":msg})

def loadcategory():
    s="select * from tbldepartment "
    c.execute(s)
    data=c.fetchall()
    return data


def doctors (request):
    s="select * from doctorregistration where email in(select username from tbllogin where status='1')"
    c.execute(s)
    data=c.fetchall()
    return render (request,"doctors.html",{"data":data}) 


def registration (request):
    msg=""
    if request.POST:
        name=request.POST["name"]
        address=request.POST["address"]
        email=request.POST["email"]
        contacts=request.POST["contacts"]
        password=request.POST["password"]
        s="SELECT count(*) FROM tbllogin WHERE username='"+email+"'"
        c.execute(s)
        d=c.fetchone()
        if d[0]==0:
            s="insert into tblregistration (name,address,contact,email) values('"+name+"','"+address+"','"+contacts+"','"+email+"')"
            print(s)
            try:
                c.execute(s)
                db.commit()
            except:
                msg="error"
            else:
                s="insert into tbllogin (username,password,usertype,status) values('"+email+"','"+password+"','patient','1')"
                try:
                    c.execute(s)
                    db.commit ()
                except:
                    msg="error"
                else:
                    msg="registered successfully"


        
    return render (request,"registration.html",{"msg":msg})

def doctorregistration (request):
    msg=""
    department=loadcategory()
    if request.POST:
        name=request.POST["name"]
        address=request.POST["address"]
        email=request.POST["email"]
        contacts=request.POST["contacts"]
        password=request.POST["password"]
        img=request.FILES["licence"]
        dep=request.POST["dep"]
        fees=request.POST["fees"]
        fs=FileSystemStorage()
        filename=fs.save(img.name,img)
        uploaded_file_url=fs.url(filename)
        img1=request.FILES["img"]
        fs=FileSystemStorage()
        filename1=fs.save(img1.name,img1)
        uploaded_file_url1=fs.url(filename1)
        s="SELECT count(*) FROM tbllogin WHERE username='"+email+"'"
        c.execute(s)
        d=c.fetchone()
        if d[0]==0:
            s="insert into doctorregistration (name,address,contact,email,licence,img,depId,consultationfee) values('"+name+"','"+address+"','"+contacts+"','"+email+"','"+uploaded_file_url+"','"+uploaded_file_url1+"','"+dep+"','"+fees+"')"
            print(s)
            try:
                c.execute(s)
                db.commit()
            except:
                msg="error"
            else:
                s="insert into tbllogin (username,password,usertype,status) values('"+email+"','"+password+"','doctor','0')"
                try:
                    c.execute(s)
                    db.commit()
                except:
                    msg="error"
                else:
                    msg="Registered successfully. Wait for approval"


        
    return render (request,"doctorregistration.html",{"msg":msg,"department":department})
  


def admincustomer (request):
    return render (request,"admincustomer.html")

  
def adminhome(request):
    return render(request,"adminhome.html")

def admindoctor(request):
    s="select * from doctorregistration where email in(select username from tbllogin where status='0')"
    c.execute(s)
    data=c.fetchall()
    s="select * from doctorregistration where email in(select username from tbllogin where status='1')"
    c.execute(s)
    data1=c.fetchall()
    return render(request,"admindoctor.html",{"data":data,"data1":data1})
def updateuser(request):
    email=request.GET.get("id")
    status=request.GET.get("status")
    url=request.GET.get("url")
    s="update tbllogin set status='"+status+"' where username='"+email+"'"
    c.execute(s)
    db.commit()
    return HttpResponseRedirect(url)

def adminpatient(request):
    s="select * from tblregistration where email in(select username from tbllogin where status='1')"
    c.execute(s)
    data=c.fetchall()
    return render(request,"adminpatient.html",{"data":data})

def patienthome (request):
    msg=""
    email=request.session['email']
    s="select * from tblregistration where email='"+email+"' "
    c.execute(s)
    data=c.fetchall()
    if request.POST:
            name=request.POST["name"]
            address=request.POST["address"]
            email=request.POST["email"]
            contacts=request.POST["contacts"]
        
            s="update tblregistration set name='"+name+"',address='"+address+"',contact='"+contacts+"' where email='"+email+"'"
            print(s)
            try:
                c.execute(s)
                db.commit()
            except:
                msg="error"
            else:
                msg="Updated successfully"        
    return render (request,"patienthome.html",{"msg":msg,"data":data})

def doctorhome (request):
    msg=""
    email=request.session['email']
    
    if request.POST:
            name=request.POST["name"]
            address=request.POST["address"]
            email=request.POST["email"]
            contacts=request.POST["contacts"]
        
            s="update doctorregistration set name='"+name+"',address='"+address+"',contact='"+contacts+"' where email='"+email+"'"
            print(s)
            try:
                c.execute(s)
                db.commit()
            except:
                msg="error"
            else:
                msg="Updated successfully"   
    s="select * from doctorregistration where email='"+email+"' "
    c.execute(s)
    data=c.fetchall()     
    return render (request,"doctorhome.html",{"msg":msg,"data":data})

def doctorbooking(request):
    pemail=request.session['email']
    s="select tblconsultation.*,tblregistration.name from tblconsultation,tblregistration where tblconsultation.pemail=tblregistration.email and tblconsultation.demail='"+pemail+"'"
    c.execute(s)
    data=c.fetchall()
    print(data)
    return render(request,"doctorbooking.html",{"data":data})

def doctortestresult(request):
    pemail=request.session['email']
    s="select tblconsultation.*,tblregistration.name,tblprescription.diagnosis,tbltest.tests,tbltestresult.testPath from tblconsultation,tblregistration,tbltest,tbltestresult,tblprescription where tblconsultation.pemail=tblregistration.email and tblconsultation.demail='"+pemail+"' and tbltestresult.testId=tbltest.testId and tbltest.prescId=tblprescription.prescId and tblprescription.cId=tblconsultation.cId"
    c.execute(s)
    data=c.fetchall()
    
    return render(request,"doctortestresult.html",{"data":data})

def doctorpatient(request):
    bid=request.GET.get("id")
    s="select * from tblregistration where email in(select pemail from tblconsultation where cId='"+bid+"')"
    c.execute(s)
    patient=c.fetchall()
    s="select doctorregistration.name,tblconsultation.cdate,tblconsultation.symptoms,tblconsultation.problems,tblconsultation.history,tblprescription.diagnosis,tblprescription.prescription from doctorregistration,tblconsultation,tblprescription where doctorregistration.email=tblconsultation.demail and tblconsultation.cId=tblprescription.cId and tblconsultation.cId='"+str(bid)+"'"
    c.execute(s)
    history=c.fetchall()
    s="select * from tblconsultation where cId='"+bid+"'"
    c.execute(s)
    consult=c.fetchall()
    if request.POST:
        return HttpResponseRedirect("/doctorprescription?id="+str(bid))
    return render(request,"doctorpatient.html",{"patient":patient,"history":history,"consult":consult})

def doctorprescription(request):
    msg=""
    bid=request.GET.get("id")
    if request.POST:
        diagnosis=request.POST["diagnosis"]
        prescription=request.POST['prescription']
        test=request.POST['test']
        s="insert into tblprescription(cId,pdate,diagnosis,prescription) values('"+bid+"',(select sysdate()),'"+diagnosis+"','"+prescription+"')"
        try:
            c.execute(s)
            db.commit()
        except:
            msg="Sorry some error occured"
        else:
            s="update tblconsultation set status='Prescription added' where cId='"+bid+"'"
            try:
                c.execute(s)
                db.commit()
            except:
                msg="Sorry some error in updation"
            else:
                if test=="Yes":
                    s="select max(prescId) from tblprescription"
                    c.execute(s)
                    d=c.fetchone()
                    prescid=d[0]
                    return HttpResponseRedirect("/doctortest?id="+str(prescid))
                msg="Prescription added"
    return render(request,"doctorprescription.html",{"msg":msg})

def doctortest(request):
    msg=""
    prescid=request.GET.get("id")
    if request.POST:
        test=request.POST['txtTest']
        desc=request.POST['txtDesc']
        s="insert into tbltest(prescId,tests,description) values('"+str(prescid)+"','"+test+"','"+desc+"')"
        try:
            c.execute(s)
            db.commit()
        except:
            msg="Sorry some error occured"
        else:
            msg="Test added"
    return render(request,"doctortest.html",{"msg":msg})

def patientquestion (request):
    email=request.session['email']
    s="select * from tblquestion"
    c.execute(s)
    data=c.fetchall() 
    raw_score=0
    if request.POST:
        s="insert into tblresponsemaster(pemail,rdate) values('"+email+"',(select sysdate()))"
        c.execute(s)
        db.commit()
        for i in data:
                nm="point"+str(i[0])
                name=request.POST[nm]
                print(name)
                if i[0]==1 or i[0]==7 or i[0]==10 or i[0]==13 or i[0]==17 or i[0]==21 or i[0]==25 or i[0]==29:
                        if name=="1":
                            name="4"
                        elif name=="2":
                            name="3"
                        elif name=="3":
                            name="2"
                        elif name=="4":
                            name="1"
                raw_score+=int(name) 
                print(raw_score) 
                psq=(raw_score-30)/90 
                print(psq)
                level=""
                if psq>=0 and psq<0.34:
                    level="Low"
                elif psq>=0.34 and psq<=0.46:
                    level="Moderate"
                else:
                    level="High"
                s="insert into tblresponsechild(rId,question,resp) values((select max(rId) from tblresponsemaster),'"+i[1]+"','"+name+"')"
                c.execute(s)
                db.commit()
        s="insert into tblresult(pemail,date,psq,result) values('"+email+"',(select sysdate()),'"+str(psq)+"','"+level+"')"
        c.execute(s)
        db.commit()
        return HttpResponseRedirect("/patientresult?psq="+str(psq)+"&level="+level)
    return render(request,"patientquestion.html",{"datas":data})

def patientresult (request):
    psq=request.GET.get("psq")
    level=request.GET.get("level")
    return render(request,"patientresult.html",{"psq":psq,"level":level})

def patientviewdoctor (request):
    s="select * from doctorregistration where email in(select username from tbllogin where status='1') "
    c.execute(s)
    data=c.fetchall()
    if request.POST:
        dep=request.POST['dep']
        s="select * from doctorregistration where email in(select username from tbllogin where status='1') and depId='"+str(dep)+"'"
        c.execute(s)
        data=c.fetchall()
    department=loadcategory()
    return render(request,"patientviewdoctor.html",{"data":data,"department":department})

def patientdoctor (request):
    did=request.GET.get("id")
    pemail=request.session['email']
    s="select * from doctorregistration where doctorid='"+did+"' "
    c.execute(s)
    data=c.fetchall()
    s="select count(*) from tblrating where dId='"+str(did)+"' and pemail='"+pemail+"'"
    c.execute(s)
    d=c.fetchone()
    ratingcount=d[0]
    feedback=""
    if ratingcount>0:
        s="select tblregistration.name,tblrating.feedback from tblrating,tblregistration where tblrating.pemail=tblregistration.email and tblrating.did='"+str(did)+"'"
        c.execute(s)
        feedback=c.fetchall()
    s="select avg(rating) from tblrating where dId='"+str(did)+"' "
    c.execute(s)
    d=c.fetchone()
    rating=int(d[0])
    return render(request,"patientdoctor.html",{"data":data,"ratingcount":ratingcount,"rating":rating,"rating":rating,"feedback":feedback})

def patientrating(request):
    msg=""
    did=request.GET.get("id")
    pemail=request.session['email']
    if request.POST:
        rating=request.POST['rating']
        feedback=request.POST['feedback']
        s="insert into tblrating(dId,pemail,rating,feedback) values('"+did+"','"+pemail+"','"+rating+"','"+feedback+"')"
        try:
            c.execute(s)
            db.commit()
        except:
            msg="Sorry some error occured"
        else:
            return HttpResponseRedirect("/patientdoctor?id="+str(did))
    return render(request,"patientrating.html",{"msg":msg})

def patientconsult(request):
    demail=request.GET.get("id")
    pemail=request.session['email']
    if request.POST:
        
        symp=request.POST['symptoms']
        prob=request.POST['problems']
        history=request.POST['history']
        s="insert into tblconsultation (pemail,demail,cdate,symptoms,problems,history,status) values('"+str(pemail)+"','"+str(demail)+"',(select sysdate()),'"+str(symp)+"','"+str(prob)+"','"+str(history)+"','submitted')"
        c.execute(s)
        db.commit()
        return HttpResponseRedirect("/patientconsultation")
    return render(request,"patientconsult.html")

def patientconsultation(request):
    pemail=request.session['email']
    s="select tblconsultation.*,doctorregistration.name from tblconsultation,doctorregistration where tblconsultation.demail=doctorregistration.email and tblconsultation.pemail='"+pemail+"' order by tblconsultation.cId"
    c.execute(s)
    data=c.fetchall()
    return render(request,"patientconsultation.html",{"data":data})

def patientprescription(request):
    cid=request.GET.get("id")
    s="select prescId from tblprescription where cId='"+str(cid)+"'"
    c.execute(s)
    d=c.fetchone()
    precid=d[0]
    s="select count(*) from tblpayment where prescId='"+str(precid)+"'"
    c.execute(s)
    d=c.fetchone()
    if d[0]==0:
        s="select consultationfee from doctorregistration where email in(select demail from tblconsultation where cId='"+str(cid)+"')"
        c.execute(s)
        d=c.fetchone()
        amt=d[0]
        return HttpResponseRedirect("/payment?amt="+str(amt)+"&prescid="+str(precid))
    test=""
    s="Select * from tblprescription,tblconsultation,tblregistration,doctorregistration where tblprescription.cId='"+cid+"' and tblprescription.cId=tblconsultation.cId and tblregistration.email=tblconsultation.pemail and tblconsultation.demail=doctorregistration.email"
    c.execute(s)
    data=c.fetchall()
    s="Select * from tbltest where prescId in(select prescId from tblprescription where cId='"+str(cid)+"')"
    c.execute(s)
    test=c.fetchall()
    s="select count(*) from tbltestresult where testId in(select testId from tbltest where prescId in(select prescId from tblprescription where cId='"+str(cid)+"'))"
    c.execute(s)
    d=c.fetchone()
    testcount=int(d[0])
    return render(request,"patientprescription.html",{"data":data,"test":test,"testcount":testcount})

def payment(request):
    amt=request.GET.get("amt")
    prescid=request.GET.get("prescid")
    if request.POST:
        s="insert into tblpayment (prescId,pDate,amt) values('"+prescid+"',(select sysdate()),'"+amt+"')"
        c.execute(s)
        db.commit()
        s="select cId from tblprescription where prescId='"+str(prescid)+"'"
        c.execute(s)
        d=c.fetchone()
        cid=d[0]
        return HttpResponseRedirect("/patientprescription?id="+str(cid))
    return render(request,"payment.html",{"amt":amt})

def patientaddresult(request):
    msg=""
    tid=request.GET.get("id")
    if request.POST:
        myfile=request.FILES.get("txtFile")
        fs=FileSystemStorage()
        filename=fs.save(myfile.name , myfile)
        uploaded_file_url = fs.url(filename)
        s="insert into tbltestresult(testId,testPath,tDate) values('"+tid+"','"+uploaded_file_url+"',(select sysdate()))"
        try:
            c.execute(s)
            db.commit()
        except:
            msg="Sorry some error occured"
        else:
            msg="Result added"
    return render(request,"patientaddresult.html",{"msg":msg})