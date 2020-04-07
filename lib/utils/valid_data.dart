
/**
 * Created by mobit on 08/04/2016.
 */
class ValidateData {

    static RegExp validEmail(){
        return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    }

    static RegExp valiUser() {
        return RegExp(r'^[a-zA-Z0-9._-]{0,50}$');
    }
}
