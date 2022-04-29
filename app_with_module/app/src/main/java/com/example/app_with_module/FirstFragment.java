package com.example.app_with_module;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import com.example.app_with_module.databinding.FragmentFirstBinding;

import java.util.HashMap;

import io.flutter.embedding.android.FlutterActivity;

public class FirstFragment extends Fragment {

    private FragmentFirstBinding binding;

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {
        binding = FragmentFirstBinding.inflate(inflater, container, false);
        return binding.getRoot();

    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        HashMap <String,String> modelTeste = new HashMap<>();
        modelTeste.put("code","1");
        modelTeste.put("token","324fmssbndkjsnaknfklsnajfhkdasdnvlkndk");
        modelTeste.put("body","sjnvbvsdlkcnskn");

        binding.buttonFirst.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(
                        new FlutterActivity.NewEngineIntentBuilder(MyFlutterActivity.class)
                                .initialRoute("/")
                                .build(getContext())
                                .putExtra("model", modelTeste).
                                putExtra("title","Página em flutter")
                );
            }
        });
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}