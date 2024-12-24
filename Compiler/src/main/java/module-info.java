module com.compiler.compiler {
    requires javafx.controls;
    requires javafx.fxml;
    requires org.fxmisc.richtext;
    requires reactfx;
    requires jdk.jshell;
    requires JFlex;

    opens com.compiler.compiler to javafx.fxml;
    exports com.compiler.compiler;
}