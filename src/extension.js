const { Meta, St } = imports.gi;

const Main = imports.ui.main;

class Extension {

    enable() {
        Main.panel.add_style_class_name('superterran-clear-top-bar');
    }

    disable() {
        Main.panel.remove_style_class_name('superterran-clear-top-bar');
    }
};

function init() {
    return new Extension();
}
