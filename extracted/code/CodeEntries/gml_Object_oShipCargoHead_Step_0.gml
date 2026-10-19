oCutsceneControl.shakex = max(1 * max(0, 1 - (abs(x - (view_xview[0] + (view_wview[0] / 2))) / 200)), oCutsceneControl.shakex);
oCutsceneControl.shakey = max(1 * max(0, 1 - (abs(x - (view_xview[0] + (view_wview[0] / 2))) / 200)), oCutsceneControl.shakey);
if (trashed)
{
    y += 2;
}
with (instance_create(x, y, oMotionBlur))
{
    image_index = other.image_index;
    sprite_index = other.sprite_index;
    image_angle = other.image_angle;
    image_blend = other.image_blend;
}
