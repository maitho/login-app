from django.urls import path
from . import views

urlpatterns = [
    path("user-activity", views.user_activity, name="user_activity"),
    path("logout", views.logout, name="logout")
]
