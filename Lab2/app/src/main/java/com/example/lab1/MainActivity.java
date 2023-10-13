package com.example.lab1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ArrayAdapter;

import java.util.Locale;


public class MainActivity extends AppCompatActivity {

    private EditText loanAmount, interestRate, loanPeriod;
    private Spinner loanTypes;
    private Button calculateBtn;
    private CheckBox insuranceOption;
    private RadioButton annuity, differentiated;
    private TextView monthlyPaymentResult;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        loanAmount = findViewById(R.id.loanAmount);
        interestRate = findViewById(R.id.interestRate);
        loanPeriod = findViewById(R.id.loanPeriod);
        loanTypes = findViewById(R.id.loanTypes);
        calculateBtn = findViewById(R.id.calculateBtn);
        insuranceOption = findViewById(R.id.insuranceOption);
        annuity = findViewById(R.id.annuity);
        differentiated = findViewById(R.id.differentiated);
        monthlyPaymentResult = findViewById(R.id.monthlyPaymentResult);

        String[] loanTypesArray = {"Кредит на дом", "Кредит на автомобиль", "Потребительский кредит"};
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, loanTypesArray);

        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        loanTypes.setAdapter(adapter);

        calculateBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (loanAmount.getText().toString().isEmpty() ||
                        interestRate.getText().toString().isEmpty() ||
                        loanPeriod.getText().toString().isEmpty()) {
                    monthlyPaymentResult.setText("Пожалуйста, заполните все поля.");
                    return;
                }

                double principal = Double.parseDouble(loanAmount.getText().toString());
                double rate = Double.parseDouble(interestRate.getText().toString()) / 100 / 12; // Monthly interest rate
                int period = Integer.parseInt(loanPeriod.getText().toString()) * 12; // Loan period in months

                // Calculate the monthly payment
                double monthlyPayment;
                if (annuity.isChecked()) {
                    // Annuity payment formula: P = [r*PV] / [1 - (1 + r)^-n]
                    monthlyPayment = (rate * principal) / (1 - Math.pow(1 + rate, -period));
                } else if (differentiated.isChecked()) {
                    // Differentiated payment formula for the first month: P = PV/n + r*PV
                    monthlyPayment = principal / period + rate * principal;
                } else {
                    monthlyPayment = 0;
                }

                // Adjust the monthly payment based on the loan type
                String loanType = loanTypes.getSelectedItem().toString();
                switch (loanType) {
                    case "Кредит на дом":
                        monthlyPayment *= 1.01; // Increase by 1%
                        break;
                    case "Кредит на автомобиль":
                        monthlyPayment *= 1.02; // Increase by 3%
                        break;
                    case "Потребительский кредит":
                        monthlyPayment *= 1.03; // Increase by 5%
                        break;
                }

                // Adjust the monthly payment based on the insurance option
                if (insuranceOption.isChecked()) {
                    monthlyPayment *= 1.05; // Increase by 5%
                }

                // Display the result in the TextView
                monthlyPaymentResult.setText(String.format(Locale.getDefault(), "Ежемесячный платеж: %.2f", monthlyPayment));
            }
        });
    }
}