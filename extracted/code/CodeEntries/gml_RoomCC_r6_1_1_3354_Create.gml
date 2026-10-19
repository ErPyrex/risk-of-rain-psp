offset = 0;
left_door_index = 0;
right_door_index = 1;
left_frame_index = 0;
right_frame_index = 1;
left_frame_index = 2;
right_frame_index = 2;
right_door_index = 4;
with (instance_create(x, y, oBlastdoorRight))
{
    image_index = other.right_frame_index;
}
