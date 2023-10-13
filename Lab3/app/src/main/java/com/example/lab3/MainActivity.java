package com.example.lab3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private EditText name, version, language, framework;
    private Button buttonNext;

    private Button buttonSubmit;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        name = (EditText) findViewById(R.id.name);
        version = (EditText) findViewById(R.id.version);
        language = (EditText) findViewById(R.id.language);
        framework = (EditText) findViewById(R.id.framework);
        buttonNext = (Button) findViewById(R.id.buttonNext);

        buttonNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, SecondActivity.class);
                intent.putExtra("name", name.getText().toString());
                intent.putExtra("version", version.getText().toString());
                intent.putExtra("language", language.getText().toString());
                intent.putExtra("framework", framework.getText().toString());
                startActivity(intent);
            }
        });
    }
}