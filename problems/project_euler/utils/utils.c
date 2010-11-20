#include <Python.h>

static PyObject *is_prime(PyObject *self, PyObject *args) {
    /**
     * Função que recebe um inteiro como parâmatro, caso este seja um número primo, retorna
     * ele próprio, se não for retorna None
     */
    int num;
    int cont;
    if (!PyArg_ParseTuple(args, "i", &num)) {
        return NULL;
    }
    for (cont=2; cont<num; cont++) {
        if (num % cont == 0) {
            Py_RETURN_FALSE;
        }   
    }
    Py_RETURN_TRUE;
}

static PyMethodDef utils_methods[] = {
    { "is_prime", (PyCFunction)is_prime, METH_VARARGS, NULL },
    { NULL, NULL, 0, NULL }
};

PyMODINIT_FUNC initutils() {
    Py_InitModule3("utils", utils_methods, "Funções úteis para agilizar algoritmos.");
}