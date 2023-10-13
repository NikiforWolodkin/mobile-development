package com.example.lab3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class FourthActivity extends AppCompatActivity {

    private Button buttonAdd, buttonBack;
    private TextView appText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fourth);

        buttonAdd = (Button) findViewById(R.id.buttonAdd);
        buttonBack = (Button) findViewById(R.id.buttonBack);
        appText = (TextView) findViewById(R.id.textJson);

        buttonBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        buttonAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                AppData app = new AppData();
                app.Name = getIntent().getStringExtra("name");
                app.Version = getIntent().getStringExtra("version");
                app.Language = getIntent().getStringExtra("language");
                app.Framework = getIntent().getStringExtra("framework");
                app.ReleaseDate = getIntent().getStringExtra("releaseDate");
                app.License = getIntent().getStringExtra("license");
                app.IsOpenSource = getIntent().getBooleanExtra("isOpenSource", false);

                app.writeToJsonFile(FourthActivity.this, "app.json");
                app = AppData.readFromJsonFile(FourthActivity.this, "app.json");

                appText.setText(app.toString());
            }
        });
    }
}
