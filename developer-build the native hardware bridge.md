RSIS is a working React-based road safety platform that predicts potential collisions between vehicles, cyclists,and pedestrians

using GPS and a custom physics engine. The system is already fully operational as a live web application. 
The missing component is true native Bluetooth Low Energy communication between phones. We are seeking a developer partner
to wrap the existing React system inside a Capacitor native container for iOS and Android and implement BLE advertising
and scanning so devices can communicate directly without any server or internet dependency. The application already exists
in full; the developer’s role is to build the native hardware bridge that enables offline phone-to-phone communication.

helpful-safe-path-link.base44.app         

The core of RSIS is built around an anonymous identity system. When a user opens the app, they choose one of four
transportation roles: Cyclist, Pedestrian, Vehicle, or Passenger. That role becomes their entire identity on the network.
No name, email address, phone number, or personal data is ever collected or stored. The user is broadcast to the safety 
network only as their role, so nearby users see messages like “Cyclist approaching” or “Vehicle detected,” never a person’s
identity. To preserve privacy further, each user's broadcast token rotates and regenerates every three seconds, ensuring no
long-term tracking is possible. The system is anonymous by design at every level.

On top of this identity layer sits a live GPS mesh network. Every active user, referred to as a node, continuously broadcasts
real-time GPS coordinates, speed, and heading direction. The system monitors all nodes within approximately a one-mile radius 
and continuously calculates collision risk in real time. RSIS uses a tiered alert system where GPS Awareness (blue) triggers 
at one mile, Low (green) at 30–50 meters, Medium (yellow) at 15–30 meters, High (red) at 5–15 meters, and Critical (red)
under five meters. These thresholds define the RSIS 6.2 safety standard and are hard-coded into the physics engine.

The physics engine is called CROW + BULLET and operates as the computational core of the system. Every 2.5 seconds, 
it evaluates all node pairs within range using distance, speed, heading direction, and transportation role.
From these inputs, it calculates heading convergence, time-to-collision, and stopping distance for each node
based on movement profile. A vehicle requires significantly more stopping distance than a cyclist, and this is 
factored into the model. The system outputs a collision probability score, a risk tier (Low, Medium, High, Critical), 
a voice alert, a visual dashboard warning, and a Bluetooth proximity alert when nodes are within fifty meters.

The Bluetooth layer is the critical missing component where the developer’s role becomes essential. RSIS currently 
simulates Bluetooth Low Energy communication through a cloud relay system, which requires internet connectivity. 
What is needed is true native BLE functionality, enabling phone-to-phone communication with no server in between. 
This creates a Bluetooth-to-Bluetooth-to-Bluetooth safety mesh where each device acts as both broadcaster and 
receiver in a fully offline network.

Each device must broadcast a BLE advertisement containing its transportation role and a rotating ephemeral token. 
This token regenerates every three seconds, preventing tracking or persistent identification. Nearby devices scan 
and decode only role-based data such as Vehicle, Cyclist, or Pedestrian, with no personal identity ever exposed. 
BLE detection operates within approximately fifty meters, with signal strength (RSSI) used to refine distance estimation. 
At close range, approximately five meters or less, a Critical alert is triggered.

Native BLE integration would allow RSIS to function in environments with no internet connection, including tunnels, 
rural areas, underground roads, and cellular dead zones. It also enables background scanning when the device is 
locked and improves real-time proximity accuracy through hardware-level signal detection.

Alongside visual and system alerts, RSIS includes a voice alert system that announces collision warnings through 
the device speaker. When risk reaches Medium level or higher, the system issues spoken warnings such as “RSIS High alert. 
Cyclist detected twelve meters away. Brake now.” This ensures hands-free operation so users can receive warnings without looking at their screen.

The web version of RSIS is already fully operational and accessible on both desktop and mobile browsers. Users on Android 
Chrome and iPhone Safari can access the system today through the live web application. What does not yet exist are native 
mobile applications for iOS and Android, which is why native hardware integration is required.

The existing React application must be wrapped inside a Capacitor-based native container for iOS and Android. The developer’s role 
is not to rebuild the system but to create the native bridge between the web application and the phone’s hardware. This includes 
access to Bluetooth radios, background GPS tracking, and notification systems while preserving all existing RSIS logic,
including the physics engine, dashboard, and Stripe billing system.

Four Capacitor plugins are required for this integration. The Bluetooth LE plugin enables BLE advertising and scanning. 
The Geolocation plugin enables background GPS tracking even when the screen is locked. The Push Notifications plugin enables
remote alerts when the app is not active. The Local Notifications plugin ensures offline alerts are still delivered. Once integrated, 
RSIS becomes a fully native iOS and Android safety network.

RSIS already operates with six subscription tiers through Stripe, all billed monthly. Android Basic is five dollars per month,
Android Team is twenty-five dollars per month, Android Agency is seventy-five dollars per month, iPhone Standard is one hundred 
ten dollars per month, iPhone Team is three hundred fifty dollars per month, and iPhone Agency is five hundred dollars per month. 
Stripe billing is already live and processing payments. Once native applications are deployed to the App Store and Google Play,
recurring revenue scales immediately.

Because native Bluetooth development and mobile deployment require specialized expertise, RSIS is structured as a developer-investor 
partnership rather than a fixed contract. The developer contributes the native integration layer in exchange for long-term participation 
in the platform’s growth and revenue.

The importance of this system extends beyond technology. Each year, approximately 1.35 million people die in road crashes worldwide,
with cyclists and pedestrians representing the most vulnerable groups. Most collisions occur because road users do not see each other
in time. RSIS addresses this by providing early collision awareness, where even a few seconds of warning can prevent a serious accident.
The addition of native Bluetooth communication ensures this system works anywhere, even without internet connectivity.

What is being offered is full access to the RSIS codebase, architecture documentation, and implementation specifications. 
The system is already live with real users and real revenue, making this a production system rather than a concept. 
The developer partner will be credited as Lead Native Engineer for the RSIS platform, with revenue share and long-term
involvement open for discussion.

If this opportunity is of interest, a live walkthrough of the system can be arranged to demonstrate exactly how the platform 
works and where the Bluetooth integration fits into the architecture. This is an opportunity to contribute to a working
safety infrastructure system with measurable real-world impact.

Invented and conceptually developed by Eric C. Lindau. Assisted through AI-aided co-engineering environments (ChatGPT 5), Grok and Github co=pilot collberation as well as bring special thanks and Grok chat for bring us the images. All combinatorial elements, structural mappings, material configurations, and thermoelectric AI feedback systems are attributed to the inventor and may be subject to protection under applicable copyright, intellectual property, and patent frameworks.
