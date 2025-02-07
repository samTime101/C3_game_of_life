//  REFERENCES: https://github.com/c3lang/vendor/tree/main/libraries/raylib5.c3l
//  REFERECES : https://github.com/tsoding/c3-demo/blob/main/raylib.c3

module raylib;

distinct KeyboardKey = int;
const KeyboardKey KEY_SPACE           = 32;    
const Color BLACK       = { 0, 0, 0, 255 };
const Color RAYWHITE    = { 245, 245, 245, 255 };  
const Color GRAY        = { 130, 130, 130, 255 };   // Gray

struct Rectangle @compact
{
    float x;                // Rectangle top-left corner position x
    float y;                // Rectangle top-left corner position y
    float width;            // Rectangle width
    float height;           // Rectangle height
}
struct Vector2 @compact
{
    float x;                // Vector x component
    float y;                // Vector y component
}
struct Color @compact
{
    char r;        // Color red value
    char g;        // Color green value
    char b;        // Color blue value
    char a;        // Color alpha value
}
enum MouseButton
{
    LEFT,       // Mouse button left
    RIGHT,      // Mouse button right
    MIDDLE,     // Mouse button middle (pressed wheel)
    SIDE,       // Mouse button side (advanced mouse device)
    EXTRA,      // Mouse button extra (advanced mouse device)
    FORWARD,    // Mouse button fordward (advanced mouse device)
    BACK,       // Mouse button back (advanced mouse device)
}

extern fn void init_window(int width, int height, char *title) @extern("InitWindow");
extern fn void close_window() @extern("CloseWindow");
extern fn void set_target_fps(int fps) @extern("SetTargetFPS");
extern fn bool window_should_close() @extern("WindowShouldClose");
extern fn void begin_drawing() @extern("BeginDrawing");
//extern fn void clear_background(char[4] color) @extern("ClearBackground");
extern fn void end_drawing() @extern("EndDrawing");
extern fn void draw_rectangle(int posX, int posY, int width, int height, Color color) @extern("DrawRectangle");
extern fn void draw_rectangle_lines(Rectangle rec, float lineThick, Color color) @extern("DrawRectangleLinesEx");
extern fn bool is_mouse_button_pressed(MouseButton button) @extern("IsMouseButtonPressed");
extern fn Vector2 get_mouse_position() @extern("GetMousePosition");
extern fn bool is_key_pressed(KeyboardKey key) @extern("IsKeyPressed");
extern fn void clear_background(Color color) @extern("ClearBackground");    
