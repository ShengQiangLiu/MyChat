from django.db import models

# Create your models here.

class sign_on(models.Model):
    id = models.AutoField(primary_key=True, auto_created=True)
    nickname = models.CharField(max_length=64)
    password = models.CharField(max_length=32)
    email = models.EmailField()
    def __unicode__(self):
        return self.nickname

class sign_in(models.Model):
    password = models.CharField(max_length=32)
    email = models.EmailField()
    def __unicode__(self):
        return self.nickname