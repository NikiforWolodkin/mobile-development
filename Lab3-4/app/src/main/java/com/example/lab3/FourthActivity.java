package com.example.lab3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

public class FourthActivity extends AppCompatActivity {

    private List<AppData> appDataList;
    private AppDataAdapter adapter;
    private Button buttonAdd, buttonBack;
    private ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fourth);

        buttonAdd = (Button) findViewById(R.id.buttonAdd);
        buttonBack = (Button) findViewById(R.id.buttonBack);
        listView = (ListView) findViewById(R.id.listView);

        appDataList = AppData.readListFromJsonFile(this, "apps.json");
        adapter = new AppDataAdapter(this, appDataList);
        listView.setAdapter(adapter);

        buttonBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                AppData appData = (AppData) parent.getItemAtPosition(position);

                Intent intent = new Intent(view.getContext(), FifthActivity.class);
                intent.putExtra("appData", appData.toString()); // Pass the AppData object to the new activity
                startActivity(intent);
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

                appDataList.add(app);
                AppData.writeListToJsonFile(FourthActivity.this, "apps.json", appDataList);
                adapter.notifyDataSetChanged();
            }
        });
    }

    @Override
    public void onStop() {
        super.onStop();
        AppData app = new AppData();
        app.Name = getIntent().getStringExtra("name");
        app.Version = getIntent().getStringExtra("version");
        app.Language = getIntent().getStringExtra("language");
        app.Framework = getIntent().getStringExtra("framework");
        app.ReleaseDate = getIntent().getStringExtra("releaseDate");
        app.License = getIntent().getStringExtra("license");
        app.IsOpenSource = getIntent().getBooleanExtra("isOpenSource", false);

        app.writeToJsonFile(FourthActivity.this, "app.json");
    }
}
