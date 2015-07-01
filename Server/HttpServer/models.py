from django.db import models

# Create your models here.

class signon(models.Model):
    id = models.AutoField(primary_key=True, auto_created=True)
    username = models.CharField(max_length=64)
    password = models.CharField(max_length=32)
    email = models.EmailField()
    def __unicode__(self):
        return self.username


