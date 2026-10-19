var gpdes = gamepad_get_description(0);
switch (argument0)
{
    case -1:
        return "";
    case 13:
        return "ENTER";
    case 16:
        return "SHIFT";
    case 17:
        return "CTRL";
    case 32:
        return "SPACE";
    case 33:
        return "PAGE UP";
    case 34:
        return "PAGE DOWN";
    case 35:
        return "END";
    case 36:
        return "HOME";
    case 37:
        return "LEFT ARROW";
    case 39:
        return "RIGHT ARROW";
    case 38:
        return "UP ARROW";
    case 40:
        return "DOWN ARROW";
    case 45:
        return "INS";
    case 46:
        return "DEL";
    case 96:
        return "NUM 0";
    case 97:
        return "NUM 1";
    case 98:
        return "NUM 2";
    case 99:
        return "NUM 3";
    case 100:
        return "NUM 4";
    case 101:
        return "NUM 5";
    case 102:
        return "NUM 6";
    case 103:
        return "NUM 7";
    case 104:
        return "NUM 8";
    case 105:
        return "NUM 9";
    case 65:
        return "A";
    case 66:
        return "B";
    case 67:
        return "C";
    case 68:
        return "D";
    case 69:
        return "E";
    case 70:
        return "F";
    case 71:
        return "G";
    case 72:
        return "H";
    case 73:
        return "I";
    case 74:
        return "J";
    case 75:
        return "K";
    case 76:
        return "L";
    case 77:
        return "M";
    case 78:
        return "N";
    case 79:
        return "O";
    case 80:
        return "P";
    case 81:
        return "Q";
    case 82:
        return "R";
    case 83:
        return "S";
    case 84:
        return "T";
    case 85:
        return "U";
    case 86:
        return "V";
    case 87:
        return "W";
    case 88:
        return "X";
    case 89:
        return "Y";
    case 90:
        return "Z";
    case 48:
        return "0";
    case 49:
        return "1";
    case 50:
        return "2";
    case 51:
        return "3";
    case 52:
        return "4";
    case 53:
        return "5";
    case 54:
        return "6";
    case 55:
        return "7";
    case 56:
        return "8";
    case 57:
        return "9";
    case 32769:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "{";
        }
        else if (os_type == os_ps4)
        {
            return "Ÿ";
        }
        else
        {
            return "Ž";
        }
        break;
    case 32770:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "|";
        }
        else if (os_type == os_ps4)
        {
            return "¡";
        }
        else
        {
            return "‘";
        }
        break;
    case 32771:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "}";
        }
        else if (os_type == os_ps4)
        {
            return "¢";
        }
        else
        {
            return "’";
        }
        break;
    case 32772:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "„";
        }
        else if (os_type == os_ps4)
        {
            return "£";
        }
        else
        {
            return "“";
        }
        break;
    case 32773:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "…";
        }
        else if (os_type == os_ps4)
        {
            return "¤";
        }
        else
        {
            return "”";
        }
        break;
    case 32774:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "†";
        }
        else if (os_type == os_ps4)
        {
            return "¥";
        }
        else
        {
            return "•";
        }
        break;
    case 32775:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "‡";
        }
        else if (os_type == os_ps4)
        {
            return "¦";
        }
        else
        {
            return "Ö";
        }
        break;
    case 32776:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "ˆ";
        }
        else if (os_type == os_ps4)
        {
            return "§";
        }
        else
        {
            return "™";
        }
        break;
    case 32779:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "‰";
        }
        else if (os_type == os_ps4)
        {
            return "¨";
        }
        else
        {
            return "š";
        }
        break;
    case 32780:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "Š";
        }
        else if (os_type == os_ps4)
        {
            return "©";
        }
        else
        {
            return "›";
        }
        break;
    case 32777:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "‹";
        }
        else if (os_type == os_ps4)
        {
            return "ª";
        }
        else
        {
            return "œ";
        }
        break;
    case 32778:
        if (gpdes == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
        {
            return "Œ";
        }
        else if (os_type == os_ps4)
        {
            return "«";
        }
        else
        {
            return "ž";
        }
        break;
}
return "??";
