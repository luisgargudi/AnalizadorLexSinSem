package com.compiler.compiler;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.File;
import java.io.IOException;
import java.util.Objects;
import java.util.concurrent.ExecutorService;

public class CompiladorMain extends Application {
    public static ExecutorService executor;
    public static Stage stage;

    @Override
    public void start(Stage stage) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(CompiladorMain.class.getResource("view.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 800, 600);
        scene.getStylesheets().add(Objects.requireNonNull(getClass().getResource("java-keywords.css")).toExternalForm());
        scene.getStylesheets().add(Objects.requireNonNull(getClass().getResource("styles.css")).toExternalForm());
        stage.setTitle("Compilador Luis Garcia");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        //JFlex.Main.generate(new File("C:\\Users\\LuisG\\Desktop\\Compiler\\src\\main\\resources\\com\\compiler\\compiler\\Lexer.flex"));
        launch();
    }
    @Override
    public void stop()  {
        executor.shutdown();
    }
}