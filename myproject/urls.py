"""myproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myapp import views
urlpatterns = [
    path('', views.home, name='home'),
    path('about', views.about, name='about'),
    path('blog_details', views.blog_details, name='blog'),
    path('contact', views.contact, name='contact'),
    path('login1', views.login1, name='login1'),
    path('doctors', views.doctors, name='doctors'),
    # path('admincustomer', views.admincustomer, name='admincustomer'),
    path('registration', views.registration, name='registration'),
    # path('patients', views.patients, name='patients'),
    path('doctorregistration', views.doctorregistration, name='doctorregistration'),

    path('adminhome', views.adminhome, name='adminhome'),
    path('admindoctor', views.admindoctor, name='admindoctor'),
    path('updateuser', views.updateuser, name='updateuser'),
    path('adminpatient', views.adminpatient, name='adminpatient'),
    path('admindepartment', views.admindepartment, name='admindepartment'),

    path('patienthome', views.patienthome, name='patienthome'),
    path('patientquestion', views.patientquestion, name='patientquestion'),
    path('patientresult', views.patientresult, name='patientresult'),
    path('patientviewdoctor', views.patientviewdoctor, name='patientviewdoctor'),
    path('patientconsult', views.patientconsult, name='patientconsult'),
    path('patientconsultation', views.patientconsultation, name='patientconsultation'),
    path('patientprescription', views.patientprescription, name='patientprescription'),
    path('patientdoctor', views.patientdoctor, name='patientdoctor'),
    path('patientaddresult', views.patientaddresult, name='patientaddresult'),
    path('payment', views.payment, name='payment'),
    path('patientrating', views.patientrating, name='patientrating'),

    path('doctorhome', views.doctorhome, name='doctorhome'),
    path('doctorbooking', views.doctorbooking, name='doctorbooking'),
    path('doctorpatient', views.doctorpatient, name='doctorpatient'),
    path('doctorprescription', views.doctorprescription, name='doctorprescription'),
    path('doctortest', views.doctortest, name='doctortest'),
    path('doctortestresult', views.doctortestresult, name='doctortestresult'),
]