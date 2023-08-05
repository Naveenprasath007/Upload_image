# Generated by Django 4.2.4 on 2023-08-05 07:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Upload_image_app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('image', models.ImageField(blank=True, upload_to='users/%Y/%m/%d/')),
            ],
        ),
    ]
