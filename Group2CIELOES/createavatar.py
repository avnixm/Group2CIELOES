from flask import Flask, render_template, request
import python_avatars as pa

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('avatar.html')

@app.route('/generate', methods=['POST'])
def generate_avatar():
    # Get user selections from the form
    background_color = request.form['background_color']
    hair_type = request.form['hair_type']
    eyebrow_type = request.form['eyebrow_type']
    eye_type = request.form['eye_type']
    nose_type = request.form['nose_type']
    mouth_type = request.form['mouth_type']
    facial_hair_type = request.form['facial_hair_type']
    skin_color = request.form['skin_color']
    clothing_type = request.form['clothing_type']
    clothing_color = request.form['clothing_color']


    # Create the avatar
    my_avatar = pa.Avatar(
        style=pa.AvatarStyle.TRANSPARENT,
        background_color=background_color,
        top=hair_type,
        eyebrows=eyebrow_type,
        eyes=eye_type,
        nose=nose_type,
        mouth=mouth_type,
        facial_hair=facial_hair_type,
        skin_color=skin_color,
        accessory=pa.AccessoryType.NONE,
        clothing=clothing_type,
        clothing_color=clothing_color
    )

    # Render avatar SVG
    avatar_svg_bytes = my_avatar.render()

    # Return the SVG string as a response
    return avatar_svg_bytes

if __name__ == '__main__':
    app.run(debug=True)
