speed = 2;
r = place_meeting(x + 5, y, pBlock);
t = place_meeting(x, y - 5, pBlock);
b = place_meeting(x, y + 5, pBlock);
l = place_meeting(x - 5, y, pBlock);
br = place_meeting(x + 5, y + 5, pBlock);
tr = place_meeting(x + 5, y - 5, pBlock);
bl = place_meeting(x - 5, y + 5, pBlock);
tl = place_meeting(x - 5, y - 5, pBlock);
if (b == 1 && r == 0 && l == 0 && t == 0)
{
    direction = 180;
}
if (b == 1 && l == 1 && r == 0 && t == 0)
{
    direction = 90;
}
if (b == 0 && l == 0 && r == 0 && t == 0 && br == 1)
{
    direction = 270;
}
if (b == 1 && r == 1 && l == 0 && t == 0)
{
    direction = 180;
}
if (b == 0 && l == 0 && r == 0 && t == 0 && bl == 1)
{
    direction = 180;
}
if (b == 0 && l == 0 && r == 0 && t == 0 && tr == 1)
{
    direction = 0;
}
if (b == 0 && l == 0 && r == 0 && t == 0 && tl == 1)
{
    direction = 90;
}
if (b == 0 && l == 0 && r == 0 && t == 0 && bl == 1)
{
    direction = 180;
}
if (b == 0 && t == 1 && r == 0 && l == 1)
{
    direction = 0;
}
if (b == 0 && l == 0 && r == 1 && t == 1)
{
    direction = 270;
}
