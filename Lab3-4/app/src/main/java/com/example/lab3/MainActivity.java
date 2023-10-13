package com.example.lab3;

import android.content.Intent;
import android.net.Uri;
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

        Button openPhoneAppButton = (Button) findViewById(R.id.openPhoneAppButton);
        openPhoneAppButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_DIAL);
                intent.setData(Uri.parse("tel:1234567890"));
                startActivity(intent);
            }
        });

        Button openEmailAppButton = (Button) findViewById(R.id.openEmailAppButton);
        openEmailAppButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW);
                Uri data = Uri.parse("mailto:recipient@example.com?subject=");
                intent.setData(data);
                startActivity(intent);
            }
        });

        Button openCameraAppButton = (Button) findViewById(R.id.openCameraAppButton);
        openCameraAppButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent("android.media.action.IMAGE_CAPTURE");
                startActivity(intent);
            }
        });

        Button openYoutubeInBrowserButton = (Button) findViewById(R.id.openYoutubeInBrowserButton);
        openYoutubeInBrowserButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.youtube.com"));
                startActivity(intent);
            }
        });
    }
}