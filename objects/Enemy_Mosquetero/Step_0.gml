var player = instance_nearest(x, y, Player_Lautaro);

if (player == noone) {
    exit;
}

var dist = point_distance(x, y, player.x, player.y);
var dir = point_direction(x, y, player.x, player.y);

if (shoot_cooldown > 0) {
    shoot_cooldown--;
}

if (dist <= detect_range) {

    if (dist > shoot_range) {
        x += lengthdir_x(move_speed, dir);
        y += lengthdir_y(move_speed, dir);
    }

    if (dist <= shoot_range && shoot_cooldown <= 0) {

        var bullet = instance_create_layer(x,y,"Instances",Object3);
        bullet.direction = dir;
        bullet.speed = 6;

        shoot_cooldown = shoot_delay;
    }
}

