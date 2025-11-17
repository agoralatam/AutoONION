from PyQt5.QtWidgets import QWidget

def create_main_window():
    main_window_widget = QWidget()
    main_window_widget.setObjectName("main_window_widget")
    main_window_widget.resize(600, 400)
    
    return main_window_widget