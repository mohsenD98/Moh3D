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

### Directional light.  
![image](https://github.com/user-attachments/assets/6684510b-2b1a-4868-abe5-6b59914a4054)

### Point light.
![Screenshot from 2024-09-06 15-37-39](https://github.com/user-attachments/assets/f2fa5a8b-b0ee-4f3d-bc6b-dd6644c1f11e)

### Spot light.
![image](https://github.com/user-attachments/assets/9afeafa7-96ae-4546-bf79-6f9f85807d09)

### Image based light.
![image](https://github.com/user-attachments/assets/6727bcc5-bd5b-490d-b585-0c52c3186921)

### Shadow.
![image](https://github.com/user-attachments/assets/7a6386dd-df13-4d4c-ab46-bbaa04ef6536)


**🧢 Let's Have a Short Recap of What You Have Explored!**
Lighting is the key for creating a realistic 3D scene

Lighting will always be the most important defining factor of how good or realistic a 3D scene looks.


An important aspect of lighting is shadows. When lights are occluded, they should produce a shadow to create a more realistic scene.
Puctual lights

This class of lights will be lights you place inside of your scene to act as sources of light for the materials used by models.


Punctual light type includes: 

The DirectionalLight component is used to create a light that is infinitely far away and shines in a single direction. This is the type of light that is used to simulate the sun in a scene


The PointLight component is used to create a light that shines in all directions from a single point. This is the type of light that is used to simulate a light bulb in a scene.


The SpotLight component is used to create a light that shines in a cone from a single point.
Indirect Light

Direct light refers to a light emitted from a light source and directly hits a surface. Direct light can seem unrealistic since light usually bounces around and illuminates areas that are not directly lit. These additional bounces of light are referred to as indirect light. 


Indirect light types include:

Ambient light is light that is assumed to be coming from all directions. This is the type of light that is used to simulate the light that bounces around a scene and illuminates areas that are not directly lit. It is cheap to use but is not very realistic. 


Image Based Lighting (IBL) is a technique that uses a 360-degree image of the surrounding environment to simulate indirect lighting. This is a much more realistic technique than ambient light but is also more expensive.
Baked light maps help to accurately simulate the indirect light

To accurately simulate indirect lighting, you need to simulate the path of light with a ray tracer. Qt Quick 3D  has the ability to bake lightmaps with a software ray tracer. Baked light maps are textures generated by raytracing software containing the lighting information for a scene.
Camera captures a specific perspective or viewport in a scene

The goal and purpose of a camera in a 3D scene is to capture and define a specific perspective or viewpoint of that scene and project it onto a 2D surface, much like how a real-world camera captures a scene and displays it as a photograph. The magic behind this transformation lies in the mathematics of projection.
Model, View and Projection define how objects appear in 2D screen

Projection refers to the process of mapping the infinite 3D world onto a finite 2D plane. To determine how objects from the 3D world appear on the 2D screen, we use a combination of three main matrices: Model, View, and Projection.


Model Matrix is responsible for transforming the 3D coordinates of your model from its own local space to scene space. It defines the position, rotation, and scale of the model within the world. 


View Matrix represents the camera's position and orientation in the world. When applied, it effectively transforms the entire world around the camera's viewpoint. This ensures that objects are drawn in the correct location relative to the camera's perspective.


Projection Matrix transforms all the world-coordinates into a so-called clip space, which then gets "clipped" to a range, and normalized to result in the final coordinates on your 2D screen. The key difference between each of the different camera types is how this projection created.
Different camera components affect on how the 3D scene is visualised

The PerspectiveCamera component is the most common type of camera used in 3D scenes. It is also the type of camera used by most real-world cameras. It is called a perspective camera because it uses perspective projection to project the 3D scene onto a 2D surface. With perspective projection, objects closer to the camera appear more prominent, while those farther away appear smaller, giving the scene depth and a sense of three-dimensionality.


The OrthographicCamera component offers a unique way to visualise 3D scenes. OrthographicCamera provides a straight-on, depthless view. This means that objects, regardless of their distance from the camera, are displayed at the same size.


The FrustumCamera component is a specialised type of perspective camera that provides more granular control over the shape and bounds of the viewing volume. At its core, it is a perspective camera, but with an added flexibility that allows you to create asymmetrical frustums.
Control the camera with build-in controllers or create your own

The most simple way to control a camera is to have the Camera "Look At" another Node or position in the scene. There are two ways to do this. The first is to do so declaratively by setting the lookAtNode property to a Node. The second is to do so imperatively by using the lookAt function on the Camera.  


OrbitCameraControllor component is a built-in camera control which automatically moves the camera around for you.


The WasdController component is not just a camera controller and can be used to move any Node in the scene.

