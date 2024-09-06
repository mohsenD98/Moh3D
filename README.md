# Learning path of openGL

### Basic Element.
![image](https://github.com/user-attachments/assets/8caff6b9-fda4-4dd4-9e0d-bbcee50f3e3c)

### Views and Scenes.

[Screencast from 2024-09-04 22-55-38.webm](https://github.com/user-attachments/assets/b8b42411-3285-4fd7-a080-2aea5de299a4)

### Nodes and Transforms.
![image](https://github.com/user-attachments/assets/769692c1-3f9f-4594-8536-8e409fb02b87)

### Node Component Types.
![image](https://github.com/user-attachments/assets/ce3979e5-1582-48d7-91f6-cafedf6a32b5)

**🧢 Let's Have a Short Recap of What You Have Explored!**
View3D component

The viewport in a 3D scene is represented by the View3D component. Essentially, View3D is a 2D Item that can be positioned anywhere within your larger Qt Quick scene. Its primary function is to render a 3D scene, ultimately producing a 2D representation of that scene.


To render anything, View3D must have both a camera and some content (something to render). There are a few renderable types available (elements that provide both geometry and a material).
Views and Scenes

A view refers to the perspective or angle from which an object or scene is being observed in three dimensions.


A scene refers to a virtual environment that is created using 3D modeling software. A scene typically consists of one or more 3D objects, such as characters, buildings, or landscapes, which are placed in a virtual space or environment.
3D Scene Are Composed of Nodes

You can add 3D nodes in the scene:

- directly as children of the View3D or 

- by setting the importScene property of a View3D to a Node that represents a scene. 


The latter method allows you to create a scene in one location and then utilize it in multiple views, which is beneficial if you wish to display the same scene from different perspectives or with different cameras. It is also advantageous if you aim to show different sections of the same scene in multiple views.
Node Provides a Transformation Matrix and a List of Children

A node refers to a basic element or building block of a larger 3D scene or model. Nodes function similarly to the Item component in a 2D scene.


While they do not have a visual representation themselves, they possess a transform matrix and a list of child nodes. The transform matrix determines the node's position within the scene, and the child nodes are positioned relative to their parent node.


Qt Quick 3D employs a right-handed coordinate system, meaning the Y axis points upwards, the X axis extends to the right, and the Z axis protrudes out of the screen. It's crucial to bear this in mind when positioning nodes within the scene.
Components Provide Instructions for the Renderer

While you can use the Node component directly, it by itself does not provide much more functionality than a transformation matrix and a list of children. Usually, you will use a component that inherits from Node and will provide instructions for the renderer to draw something. These components include cameras, lights, models, and 2D content.

### Light.  
![image](https://github.com/user-attachments/assets/6684510b-2b1a-4868-abe5-6b59914a4054)




