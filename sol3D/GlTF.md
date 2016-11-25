# Format glTF

## History
The glTF was created by Khronos Group. It was created to be dynamic: the runtime processing for unpacking and using the 3D assets is minimised.

## Structure
The glTF format is composed of four files (or types of files).

###The .glTF file
1.This file is based on JSON format with a structure divided in five groups: 
1. scenes, nodes, cameras and animations,
2. meshes, textures, images and samplers,
3. buffers, buffers views and accessors, the fourth, materials, techniques, programs and shaders 
4. skins.

###The binary file
The .bin file is the geometry and animation file.

###The images (jpg, png, ...)
It represents the textures of the model.

###The .glsl file
For rendering the models, it needs shader programs contain in this file.

**Attention:** The glTF is not a readable human format that is why, the user usually converts a 3d file (.dae, .ply, ...) in glTF file with a convertissor.

## Qualities
The glTF format is designed for 3d content transfer. Fast and efficient, it is more dynamic than others 3d formats.

## Inconvenients
It is not a readable human format, but tools of conversion exist to transform a 3d format (.dae, ...) into glTF.

## Links
Definition of glTF by KhronosGroup
https://www.khronos.org/gltf 

Github file with links for the specifications, the convertissors.
https://github.com/KhronosGroup/glTF 
