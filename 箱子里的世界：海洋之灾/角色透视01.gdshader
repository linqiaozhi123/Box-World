shader_type canvas_item;


void fragment() {
    // 获取uv坐标
    vec2 uv = UV;
	float a = -0.25;
	float b =5.;
    // 将uv坐标进行梯形变换
	uv.y-=b;uv.y*=a;
	uv.x-=.5;
	uv.x =uv.x/uv.y;
	uv.x+=.5;
	uv.y/=a;uv.y+=b;
    // 从纹理中采样颜色
    COLOR = texture(TEXTURE, uv);
}