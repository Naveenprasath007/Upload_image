from django.db import models

# Create your models here.
class filepath(models.Model):
    path = models.CharField(db_column='Path', max_length=250) 

    def __str__(self):
        return self.path