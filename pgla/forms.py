from django import forms
from .models import Link

class LinkForm(forms.ModelForm):

    def clean(self):
        cleaned_data = super().clean()
        billing_date = cleaned_data.get("billing_date")
        activation_date = cleaned_data.get("activation_date")

        if billing_date and activation_date:
            if not activation_date >= billing_date:
                raise forms.ValidationError(
                    "The Activation Date has to be on the same day or after the Billing Date"
                )

        billing_date = cleaned_data.get("billing_date")
        activation_date = cleaned_data.get("activation_date")



    class Meta:
        model = Link
        exclude = []




