// GAME OF LIFE IN C3:
// FROM MY OWN IMPLEMNTATION OF GAME OF LIFE IN C: https://github.com/samTime101/game-of-life/blob/main/main.c
// AUTHOR : SAMIP REGMI


import raylib;
import std::io;

    const int COLS = 40;
    const int ROWS = 40;
    const int SCREEN_WIDTH = 600;
    const int SCREEN_HEIGHT = 600;
    const int CELL_WIDTH = SCREEN_WIDTH /  COLS;
    const int CELL_HEIGHT = SCREEN_HEIGHT / ROWS ; 
    const int FPS = 60;
    int [ROWS][COLS] mat;
    int [ROWS][COLS] buffer;
    int play = 0;

fn void main(){


    raylib::set_target_fps(FPS);
    raylib::init_window(SCREEN_WIDTH , SCREEN_HEIGHT , "Game Of Life in C3: Samip Regmi | SamTime101");


    foreach (row_index, row : mat)
    {
        foreach (col_index, value : row)
        {
            value = 0;
        }
    }

    while(!raylib::window_should_close()){ 
    if(raylib::is_mouse_button_pressed(raylib::MouseButton.LEFT)){
	raylib::Vector2 mPos = raylib::get_mouse_position();
        int c = (int)mPos.x / CELL_WIDTH;
        int r = (int)mPos.y / CELL_HEIGHT;
        if (r >= 0 && r < ROWS && c >= 0 && c < COLS)
        {
        mat[r][c] = (mat[r][c] == 0)? 1 : 0;
	
        }
    }
	if(raylib::is_key_pressed(raylib::KEY_SPACE)){
    play = (play == 0) ? 1 : 0;       
	}
        if (play){
            for (int i = 0; i < ROWS; i++)
            {
                for (int j = 0; j < COLS; j++)
                {
                    int up = (i - 1 + ROWS) % ROWS;
                    int down = (i + 1) % ROWS;
                    int right = (j + 1) % COLS;
                    int left = (j - 1 + COLS) % COLS;
                    int life = mat[up][left] + mat[up][j] + mat[up][right] +
                                mat[i][left] + mat[i][right] +
                                mat[down][j] + mat[down][left] + mat[down][right];
                    if (mat[i][j] == 1 && (life < 2 || life > 3))
                    {
                        buffer[i][j] = 0;
                    }
                    else if (mat[i][j] == 1 && (life == 2 || life == 3) || (mat[i][j] == 0 && life == 3))
                    {
                        buffer[i][j] = 1;
                    }
                    else
                    {
                        buffer[i][j] = mat[i][j];
                    }
                }
            }
            for (int i = 0; i < ROWS; i++)
            {
                for (int j = 0; j < COLS; j++)
                {
                    mat[i][j] = buffer[i][j];
                }
            }
        }
        raylib::begin_drawing();
        raylib::clear_background(raylib::RAYWHITE);
        
        for (int row = 0; row < ROWS; row++)
        {
            for (int col = 0; col < COLS; col++)
            {
                if (mat[row][col] != 0)
                {
                    raylib::draw_rectangle(col * CELL_WIDTH, row * CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT, raylib::BLACK);
                }
                raylib::Rectangle rect;
                rect.x = (float)(col * CELL_WIDTH);
                rect.y = (float)(row * CELL_HEIGHT);
                rect.width = (float)CELL_WIDTH;
                rect.height = (float)CELL_HEIGHT;
                raylib::draw_rectangle_lines(rect, 1.0f, raylib::GRAY);
            }
        }
        raylib::end_drawing();

    }
    raylib::close_window();
    
}
