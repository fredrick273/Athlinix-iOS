from django.db import models
from users.models import UserData

# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(UserData,on_delete=models.CASCADE)
    phone = models.CharField(max_length=15,null=True,blank=True)
    dob = models.DateField(null=True,blank=True)
    location = models.CharField(max_length=20,null=True,blank=True)
    gender = models.CharField(max_length=6,null=True,blank=True)
    is_coach = models.BooleanField(default=False)

class Athlete(models.Model):
    profile = models.OneToOneField(Profile,on_delete=models.CASCADE)
    height = models.CharField(max_length= 4 , null=True,blank=True)
    weight = models.CharField(max_length= 4 , null=True,blank=True)
    skill_level = models.CharField(max_length= 15 , null=True,blank=True)
    experience = models.IntegerField(null=True,blank=True)

class Coach(models.Model):
    profile = models.OneToOneField(Profile,on_delete=models.CASCADE)
    skill_level = models.CharField(max_length= 15 , null=True,blank=True)
    experience = models.IntegerField(null=True,blank=True)
    certificaton = models.TextField(null=True,blank=True)


