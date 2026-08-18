
# Asymmetric Shock Polar Analysis in MATLAB

A MATLAB tool for generating and plotting primary and secondary oblique shock polars ($P/P_1$ vs. $\theta$) for asymmetric flow deflections (regular reflections) in supersonic aerodynamics.

---

## Overview

When supersonic flow encounters asymmetric wedge geometries or unequal flow deflections (e.g., an asymmetric inlet or intersecting shock waves), the downstream pressure and flow direction must match across slip lines. Shock polars serve as a classic graphical method to find these interaction states.

`Asymmetric RR.m` calculates:
1. The **Base Shock Polar** for incoming flow at Mach $M_1$.
2. The **Secondary Shock Polar (Top)** shifted by a positive deflection angle ($\delta_1 = +6^\circ$).
3. The **Secondary Shock Polar (Bottom)** shifted by a negative deflection angle ($\delta_2 = -10^\circ$).

---

## Physical Model & Equations

The script utilizes standard 1D normal-component oblique shock relations ($\gamma = 1.4$):

1. **Deflection Angle Formula ($\theta$-$\beta$-$M$ Relation):**
   $$\tan\theta = 2 \cot\beta \left[ \frac{M^2 \sin^2\beta - 1}{M^2 (\gamma + \cos 2\beta) + 2} \right]$$

2. **Pressure Ratio Across Oblique Shock:**
   $$\frac{P_2}{P_1} = 1 + \frac{2\gamma}{\gamma+1} \left( M_1^2 \sin^2\beta - 1 \right)$$

3. **Downstream Mach Number ($M_2$):**
   $$M_{n2}^2 = \frac{1 + \frac{\gamma-1}{2} M_{n1}^2}{\gamma M_{n1}^2 - \frac{\gamma-1}{2}}, \quad M_2 = \frac{M_{n2}}{\sin(\beta - \theta)}$$

---

## Code Configuration

| Parameter | Default Value | Description |
| :--- | :--- | :--- |
| `M1` | `2.2` | Free-stream Mach number |
| `gamma` | `1.4` | Ratio of specific heats (Air) |
| `shift_plus_deg` | `6` | Top surface flow deflection angle (degrees) |
| `shift_minus_deg` | `10` | Bottom surface flow deflection angle (degrees) |
| `N` | `50` | Discretization points per polar branch |
| `epsv` | `1e-8` | Small numerical tolerance to avoid division by zero |

---

## Quick Start

### Prerequisites
* MATLAB R2018b or newer (no specialized toolboxes required).

### Execution
1. Clone this repository:
   ```bash
   git clone [https://github.com/your-username/asymmetric-shock-polars.git](https://github.com/your-username/asymmetric-shock-polars.git)

```

2. Open MATLAB, navigate to the directory, and run:
```matlab
shock_polar_asymmetric_inline

```



---

## Output Plot

Running the script generates a high-resolution $P/P_1$ vs. $\theta$ curve:

* **Red Curve:** Base Mach $M_1 = 2.2$ shock polar centered at $\theta = 0^\circ$.
* **Green Curve:** Secondary shock polar originating at $P_2/P_1$ for $+6^\circ$ deflection.
* **Blue Curve:** Secondary shock polar originating at $P_2/P_1$ for $-10^\circ$ deflection.

The intersection points between the top and bottom secondary polars indicate valid state solutions across the contact discontinuity (slip line).

---

## License

Distributed under the MIT License. See `LICENSE` for details.

```

```
