from PyQt5.QtWidgets import QApplication
import sys

from main_window.main_window import create_main_window

if __name__ == "__main__":
    app = QApplication(sys.argv)

    main_window = create_main_window()
    main_window.show()

    sys.exit(app.exec())