from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register(r'profiles', views.ProfileInfoViewSet)
router.register(r'athletes', views.AthleteInfoViewSet)
router.register(r'coaches', views.CoachInfoViewSet)

urlpatterns = [
    path('', include(router.urls)),
]