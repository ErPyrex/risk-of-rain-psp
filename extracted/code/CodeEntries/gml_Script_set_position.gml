var tx = readdouble();
var ty = readdouble();
var tl = readbyte();
var tr = readbyte();
var tu = readbyte();
var tuh = readbyte();
var tru = readbyte();
var trd = readbyte();
argument0.x = tx;
argument0.y = ty;
argument0.moveLeft = tl;
argument0.moveRight = tr;
if (!argument0.free || argument0.activity == 30)
{
    argument0.moveUp = tu;
}
else
{
    argument0.moveUp = 0;
    tu = 0;
}
if (argument0.object_index == oP)
{
    argument0.moveUpHold = tuh;
    argument0.ropeUp = tru;
    argument0.ropeDown = trd;
    server_message_send(argument0.sock, 0, argument0.object_index, argument0.m_id, tx, ty, tl, tr, tu, tuh, tru, trd);
}
