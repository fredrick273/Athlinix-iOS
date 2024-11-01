from django.shortcuts import render
from rest_framework import viewsets
from . import models
from . import serializers

# Create your views here.

class ProfileInfoViewSet(viewsets.ModelViewSet):
    queryset = models.Profile.objects.all()
    serializer_class = serializers.ProfileSerializer

class AthleteInfoViewSet(viewsets.ModelViewSet):
    queryset = models.Athlete.objects.all()
    serializer_class = serializers.AthleteSerializer

class CoachInfoViewSet(viewsets.ModelViewSet):
    queryset = models.Coach.objects.all()
    serializer_class = serializers.CoachSerializer

