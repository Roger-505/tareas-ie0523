# Tarea \# 2 - IE0523

## Descripción estructural de un controlador automatizado para la entrada de un estacionamiento.

Esta guía proporciona los pasos necesarios para compilar y simular un controlador automatizado estructural para la entrada de un estacionamiento en el lenguaje de descripción de hardware Verilog. 

## Requisitos

<details><summary><b>Mostrar instrucciones</b></summary>
Para Debian y Ubuntu:

* git
    ```bash
    sudo apt install git
    ```
* make
    ```bash
    sudo apt install make
    ```
* iverilog
    ```bash
    sudo apt install iverilog
    ```
* gtkwave
    ```bash
    sudo apt install gtkwave
    ```
* texlive-full
    ```bash
    sudo apt install texlive-full
    ```
* latexmk
    ```bash
    sudo apt install latexmk
    ```

</details>

## Uso
### Compilación

<details><summary><b>Mostrar instrucciones</b></summary>

1. Clona el repoistorio:
    ```bash
    git clone https://github.com/Roger-505/tareas-ie0523
    ```

2. Navega al directorio `src`:
    ```bash
    cd tareas-ie0523/t1/src
    ```

3. Genera las simulaciones:
    ```bash
    make clean wave
    ```

4. Navega al directorio `informe`:
    ```bash
    cd ../informe
    ```

5. Genera la documentación:
    ```bash
    make
    ```

</details>

### Simulación 
<details><summary><b>Mostrar instrucciones</b></summary>

Después de compilar el código fuente, se desplegarán dos ventanas de `gtkwave`, una consecutiva a la otra.
Estas contendrán las formas de onda de la simulación correspondientes a la síntesis con `RTLIL` y `cmos\_cells.lib`, respectivamente.

<center>

* `RTLIL`

![Alt text](./informe/figs/rtlil.png)

* `cmos_cells.lib`

![Alt text](./informe/figs/cmoscells.png)

* `cmos_cells.lib` + delay

![Alt text](./informe/figs/cmoscellsdelay.png)

</center>

</details>

---
