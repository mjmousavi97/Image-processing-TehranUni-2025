% ساخت تصویر اولیه 60x60
img = zeros(60, 60);
img(40, 10:30) = 1;     % یک خط افقی
img(30:50, 10) = 1;     % یک خط عمودی

% تعریف پارامترها
theta = -90; % چرخش ساعتگرد
xc = 30; yc = 30; % مرکز تصویر (60x60)

% گام 1: انتقال به مبدأ
T1 = [1 0 0;
      0 1 0;
     -xc -yc 1];

% گام 2: چرخش
R = [cosd(theta) sind(theta) 0;
    -sind(theta) cosd(theta) 0;
     0           0           1];

% گام 3: بازگشت به موقعیت قبلی
T2 = [1 0 0;
      0 1 0;
      xc yc 1];

% ماتریس نهایی
T_final = T1 * R * T2;

% تصویر خروجی
output = zeros(60, 60);

% اعمال نگاشت فوروارد
for x_in = 1:60
    for y_in = 1:60
        if img(x_in, y_in) > 0
            % مختصات ورودی (همگن)
            coord_in = [x_in, y_in, 1];
            % مختصات خروجی
            coord_out = coord_in * T_final;
            x_out = round(coord_out(1));
            y_out = round(coord_out(2));
            % قرار دادن مقدار اگر داخل تصویر مقصد بود
            if x_out >= 1 && x_out <= 60 && y_out >= 1 && y_out <= 60
                output(x_out, y_out) = img(x_in, y_in);
            end
        end
    end
end

% نمایش تصویر اولیه و خروجی
figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(output); title('Transformed Image (Forward Mapping)');
