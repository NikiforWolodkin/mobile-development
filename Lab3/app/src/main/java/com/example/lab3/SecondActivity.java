package com.example.lab3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class SecondActivity extends AppCompatActivity {

    private TextView priorData;
    private DatePicker datePicker;
    private Button buttonNext, buttonBack;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        priorData = (TextView) findViewById(R.id.priorData);
        datePicker = (DatePicker) findViewById(R.id.datePicker);
        buttonNext = (Button) findViewById(R.id.buttonNext);
        buttonBack = (Button) findViewById(R.id.buttonBack);

        String priorDataText = getIntent().getStringExtra("name") + ", "
                + getIntent().getStringExtra("version") + ", "
                + getIntent().getStringExtra("language") + ", "
                + getIntent().getStringExtra("framework");
        priorData.setText(priorDataText);

        buttonNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String dateText = String.valueOf(datePicker.getDayOfMonth()) + ":"
                        + String.valueOf(datePicker.getMonth()) + ":"
                        + String.valueOf(datePicker.getYear());

                Intent intent = new Intent(SecondActivity.this, ThirdActivity.class);
                intent.putExtra("name", getIntent().getStringExtra("name"));
                intent.putExtra("version", getIntent().getStringExtra("version"));
                intent.putExtra("language", getIntent().getStringExtra("language"));
                intent.putExtra("framework", getIntent().getStringExtra("framework"));
                intent.putExtra("releaseDate", dateText);
                startActivity(intent);
            }
        });

        buttonBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }
}
