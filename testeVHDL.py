#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Curso de Elementos de Sistemas
# Desenvolvido por: Rafael Corsi <rafael.corsi@insper.edu.br>
#
# Adaptado de :     Pedro Cunial   <pedrocc4@al.insper.edu.br>
#                   Luciano Soares <lpsoares@insper.edu.br>
# Data de criação: 07/2017


######################################################################
# Tools
######################################################################
from os.path import join, dirname
import sys, subprocess
from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')

from config import *

class tstP2(object):

    def __init__(self):
        self.pwd = os.path.dirname(os.path.abspath(__file__))
        self.rtl = os.path.join(self.pwd,'src/rtl/')
        self.tst = os.path.join(self.pwd,'tests/')
        self.log = os.path.join(TOOL_PATH,'log','logC.xml')
        self.work = vhdlScript(self.log)

    def addSrc(self, work):
        work.addSrc(self.rtl)
        work.addSrc(self.rtl + 'register4/')
        work.addSrc(self.rtl + 'bcdAdder/')

    def addTst(self, work):
        if work.addTstConfigFile(self.tst) is False:
            sys.exit(1)

    def add(self, work):
        self.addSrc(work)
        self.addTst(work)

    def head(self):
        logLogiComb("---------- Portas Logicas            ")
        logLogiComb("---------- 03-Logica-Combinacional   ")

if __name__ == "__main__":

    # inicializa notificacao
    noti = notificacao('Simulado P2')

    tstP2 = tstP2()
    tstP2.add(tstP2.work)
    if tstP2.work.run() is -1:
        noti.error('\n Erro de compilação VHDL')
        sys.exit(-1)

    #print("===================================================")
    #r = report(tstP2.log, 'C', 'HW')

    # notificacao / log do teste
    #noti.hw(r)

    #print("Reporting test result to server")
    #r.send()
    #sys.exit(r.error)
    print("===================================================")



