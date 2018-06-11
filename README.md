# OrbitSimulator

<b>What is an orbit simulator and what does this one do?</b>

Our orbit simulator is a program that takes a system of bodies and simulates the effects of gravity on each of them due to all of the other bodies in the system. The setup is fairly simple: the user can use their mouse to place multiple bodies on the screen with masses and initial velocities that they are also able to determine through keyboard input. The user can then run the simulation to observe the gravitational forces each of the bodies exert on each other and their subsequent motion.

Alternatively, the user has the option of choosing a system from a menu of several pre-set situations, such as a two-body planet-satellite system or a binary star system, to run the simulation on. The user is not able to alter the mass or initial velocities of any of the planets or satellites in any of these pre-set situations. These pre-set situations include monitors that display the x- and y-velocities of each of the bodies in the system at any given time.

<b>Features</b>

Our orbit simulator has several important features, namely:

<ol>
  <li>Pre-set scenarios</li>
  <ul>
    <li>
      If the user doesn't want to set up their own system, they can choose from a series of pre-set situations, such as a basic planet-sun system or a binary star system. The user would be able to select if they wanted to create their own system or run a pre-set one upon first running the program. These pre-set situations  illustrate particularly interesting or fundamental systems. They  also include monitors that display the x- and y-velocities of each body in the system.
    </li>
  </ul>
  <li>User-created scenarios</li>
  <ul>
    <li>
      Alternatively, the user can create their own system by placing bodies on the screen with their mouse (and clearing the screen if necessary). They are also able to determine the mass and initial velocity of each of the bodies in the system through keyboard input. The user can then run the simulation on their generated system.
    </li>
  </ul>
  <li>Multiple-body systems</li>
  <ul>
    <li>
      This simulation actually works on any number of bodies!
    </li>
  </ul>
</ol>

<b>Suggestions for user-generated situations</b>

<ol>
  <li>
Place a body at the center of the screen. Enter the following values:

Mass: 1000000000000000000000000000 (10E27)
x-velocity: 0
y-velocity: 0

Place a body roughly half an inch below it. Enter the following values:

Mass: 1000000000000000000000 (10E21)
x-velocity: 1
y-velocity: 0

This system should imitate the pre-set sun-planet system.
</li>
<li>
Alternatively, place two bodies at the center of the screen at a distance of roughly half an inch apart.

Enter the following values for the first body:

Mass: 1000000000000000000000000000 (10E27)
x-velocity: 0
y-velocity: -.85

Enter the following values for the second body:

Mass: 1000000000000000000000000000 (10E27)
x-velocity: 0
y-velocity: .85

This system should imitate the pre-set binary star system.
</li>
</ol>

<b>Instructions</b>

To run this simulation, the user must change the directory to OrbitSimulator and enter:

<i>processing OrbitSimulator.pde</i>

into their terminal. They should then follow the directions in the start menu.
