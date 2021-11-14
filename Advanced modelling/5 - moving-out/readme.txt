En el ejercicio 5 Moving Out de la práctica de Advanced modelling hemos conseguido que el planificador sgplan522
nos muestre un plan exitoso, pero cuando no usamos forall y when.

En un principio, hay que comentar el código donde se usa forall y when, para que no de error de LPG: Segmentation Fault.

Luego, hemos probado a quitar todos los durative-action aunque no sean en la acción en la que está forall y when.
Con el planificador Optic no se obtiene ningún resultado.
El planificador sgplan522 y el planificador online del MIT nos proporciona un plan satisfactorio.
Se pasa enlace del planificador online: http://editor.planning.domains/#edit_session=p3FhjiUwNtdAI2s

Con esto hemos concluido que no hay que poner durative-action en ninguna de las acciones.
Se dijo en clase que move-container y put-in daba problemas y que no se hiciera con duración,
pero al usar una duración en take-out es cuando empiezan los errores y los problemas.