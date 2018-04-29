from rest_framework import serializers
from django.contrib.auth.models import User
from pgla.models import Link, Note, Country, Client, Ticket, Configuration, Profile

class ProfileSerializer(serializers.ModelSerializer):
    id = serializers.CharField(required=False, allow_blank=True, max_length=100)
    class Meta:
        model = Profile

class UserSerializer(serializers.ModelSerializer):
    id = serializers.CharField(required=False, allow_blank=True, max_length=100)
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'first_name', 'last_name')

class LinkSerializer(serializers.ModelSerializer):
    #billing_date = serializers.DateField(required=False, allow_null=True)

    class Meta:
        model = Link
        fields = ('pgla', 'nsr', 'address', 'billing_date')

    def create(self, validated_data):
        return Link.objects.create(**validated_data)

class NoteSerializer(serializers.ModelSerializer):
    id = serializers.CharField(required=False, allow_blank=True, max_length=100)
    class Meta:
        model = Note

    def create(self, validated_data):
        return Note.objects.create(**validated_data)

class CountrySerializer(serializers.ModelSerializer):
    id = serializers.CharField(required=False, allow_blank=True, max_length=100)

    class Meta:
        model = Country

class ClientSerializer(serializers.ModelSerializer):
    id = serializers.CharField(required=False, allow_blank=True, max_length=100)

    class Meta:
        model = Client

class ConfigurationSerializer(serializers.ModelSerializer):
    id = serializers.CharField(required=False, allow_blank=True, max_length=100)

    class Meta:
        model = Configuration

class TicketSerializer(serializers.ModelSerializer):
    id = serializers.CharField(required=False, allow_blank=True, max_length=100)

    class Meta:
        model = Ticket

class ConfigurationSerializer(serializers.ModelSerializer):
    id = serializers.CharField(required=False, allow_blank=True, max_length=100)
    class Meta:
        model = Configuration

    def create(self, validated_data):
        return Configuration.objects.create(**validated_data)
