from rest_framework import serializers
from . import models

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Profile
        fields = '__all__'

class AthleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Athlete
        fields = '__all__'

class CoachSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Coach
        fields = '__all__'
