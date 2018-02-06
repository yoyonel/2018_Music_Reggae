#!/usr/bin/env sh

# Example: 
# ./ffmpeg_image-audio_to_video.sh \
#		2018-02-06_Riff_Reggae/data/reggae.jpg \
#		2018-02-06_Riff_Reggae/export/MP3/Riffs\ Reggae\ -\ Bass\ -\ Keyboard\ -\ Afrika\ rythms.mp3 \
#		test.mp4

# $1: IMPORT: Image
# $2: IMPORT: Audio
# $3: EXPORT: Video

# https://gist.github.com/hfossli/5996260

__INPUT_IMAGE=$1
__INPUT_AUDIO=$2
__OUTPUT_VIDEO=$3

ffmpeg 					\
	-loop 1 			\
	-i "$__INPUT_IMAGE"	\
	-i "$__INPUT_AUDIO"	\
	-c:v libx264		\
	-tune stillimage	\
	-c:a aac -b:a 192k	\
	-pix_fmt yuv420p	\
	-shortest			\
	"$__OUTPUT_VIDEO"
