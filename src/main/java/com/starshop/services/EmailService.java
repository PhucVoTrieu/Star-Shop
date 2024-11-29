package com.starshop.services;

public interface EmailService {
    void sendResetPasswordEmail(String to, String token);
}