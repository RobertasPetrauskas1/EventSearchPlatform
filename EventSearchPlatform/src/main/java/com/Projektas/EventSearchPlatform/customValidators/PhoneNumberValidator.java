package com.Projektas.EventSearchPlatform.customValidators;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneNumberValidator implements ConstraintValidator<PhoneNumberConstraint, String> {
    @Override
    public void initialize(PhoneNumberConstraint constraintAnnotation) {

    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return s != null && s.matches("[0-9]+") && s.length() >= 9 && s.length() <= 12;
    }
}
