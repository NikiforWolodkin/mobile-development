package com.example.lab3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class ThirdActivity extends AppCompatActivity {

    private TextView priorData;
    private Spinner spinner;
    private CheckBox checkBox;
    private Button buttonNext, buttonBack;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_third);

        priorData = (TextView) findViewById(R.id.priorData);
        spinner = (Spinner) findViewById(R.id.spinner);
        checkBox = (CheckBox) findViewById(R.id.checkBox);
        buttonNext = (Button) findViewById(R.id.buttonNext);
        buttonBack = (Button) findViewById(R.id.buttonBack);

        String priorDataText = getIntent().getStringExtra("name") + ", "
                + getIntent().getStringExtra("version") + ", "
                + getIntent().getStringExtra("language") + ", "
                + getIntent().getStringExtra("framework") + ", "
                + getIntent().getStringExtra("releaseDate");
        priorData.setText(priorDataText);

        String[] options = new String[]{ "Free", "Subscription", "One time purchase"};
        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<CharSequence> adapter = new ArrayAdapter(this,
                android.R.layout.simple_spinner_item, options);

        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // Apply the adapter to the spinner
        spinner.setAdapter(adapter);

        buttonNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ThirdActivity.this, FourthActivity.class);
                intent.putExtra("name", getIntent().getStringExtra("name"));
                intent.putExtra("version", getIntent().getStringExtra("version"));
                intent.putExtra("language", getIntent().getStringExtra("language"));
                intent.putExtra("framework", getIntent().getStringExtra("framework"));
                intent.putExtra("releaseDate", getIntent().getStringExtra("releaseDate"));
                intent.putExtra("license", spinner.getSelectedItem().toString());
                intent.putExtra("isOpenSource", checkBox.isChecked());
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
