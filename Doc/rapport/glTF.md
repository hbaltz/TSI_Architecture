

<center>![glTF logo](/home/rudolf/Documents/GitHub/TSI_Architecture/Doc/rapport/glTF.png)</center>

<p style="text-align:justify;">glTF™ 1.0 (GL Transmission Format) is a royalty-free specification for the efficient transmission and loading of 3D scenes and models by applications. glTF minimizes both the size of 3D assets, and the runtime processing needed to unpack and use those assets. glTF defines an extensible, common publishing format for 3D content tools and services that streamlines authoring workflows and enables interoperable use of content across the industry.</p>

<center>![flux glTF](/home/rudolf/Documents/GitHub/TSI_Architecture/Doc/rapport/flux_glTF.png)</center>

## Advantages :

* glTF bridges the gap between 3D content creation tools and modern GL applications by providing an efficient, extensible, interoperable format for the transmission and loading of 3D content.
* glTF provides a vendor- and runtime-neutral format that can be loaded and rendered with minimal processing.
* glTF is able to faithfully preserve full hierarchical scenes with nodes, meshes, cameras, materials, and animations, while enabling efficient delivery and fast loading.
* The glTF JSON file itself is clear text, but it is compact and rapid to parse. All large data such as geometry and animations are stored in binary files that are much smaller than equivalent text representations.
* glTF data structures have been designed to mirror the GL API data as closely as possible, both in the JSON and binary files, to reduce load times. For example, binary data for meshes can be loaded directly into WebGL typed arrays with a simple data copy; no parsing or further processing is required.
* glTF makes no assumptions about the target application or 3D engine. glTF specifies no runtime behaviors other than rendering and animation
* Complete 3D scene representation.
* glTF defines a mechanism that allows the addition of both general-purpose and vendor-specific extensions.
* glTF is already used by Oslandia.

## Warning :

* glTF is not a streaming format.
* glTF is not intended to be human-readable.
* Version 1.0 of glTF does not define compression for geometry and other rich data.
