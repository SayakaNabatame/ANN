###################################################################################
##                                            __ _      _     _                  ##
##                                           / _(_)    | |   | |                 ##
##                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |                 ##
##               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |                 ##
##              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |                 ##
##               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|                 ##
##                  | |                                                          ##
##                  |_|                                                          ##
##                                                                               ##
##                                                                               ##
##              Peripheral-NTM for MPSoC                                         ##
##              Neural Turing Machine for MPSoC                                  ##
##                                                                               ##
###################################################################################

###################################################################################
##                                                                               ##
## Copyright (c) 2020-2024 by the author(s)                                      ##
##                                                                               ##
## Permission is hereby granted, free of charge, to any person obtaining a copy  ##
## of this software and associated documentation files (the "Software"), to deal ##
## in the Software without restriction, including without limitation the rights  ##
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     ##
## copies of the Software, and to permit persons to whom the Software is         ##
## furnished to do so, subject to the following conditions:                      ##
##                                                                               ##
## The above copyright notice and this permission notice shall be included in    ##
## all copies or substantial portions of the Software.                           ##
##                                                                               ##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    ##
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      ##
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   ##
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        ##
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, ##
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     ##
## THE SOFTWARE.                                                                 ##
##                                                                               ##
## ============================================================================= ##
## Author(s):                                                                    ##
##   Paco Reina Campo <pacoreinacampo@queenfield.tech>                           ##
##                                                                               ##
###################################################################################

warning('off','all');

# Package
addpath(genpath('../../../../library/algebra/matrix'));
addpath(genpath('../../../../library/algebra/tensor'));
addpath(genpath('../../../../library/math/matrix'));
addpath(genpath('../../../../library/math/vector'));
addpath(genpath('../../../../library/math/vector'));

addpath(genpath('../../../../library/nn/ann/inputs'));
addpath(genpath('../../../../library/nn/ann/components'));
addpath(genpath('../../../../library/nn/ann/functions'));
addpath(genpath('../../../../library/nn/ann/controller/fnn'));
addpath(genpath('../../../../library/nn/ann/top'));

# Constants
SIZE_L_IN = 3;
SIZE_N_IN = 3;
SIZE_D_IN = 3;
SIZE_M_IN = 3;
SIZE_K_IN = 3;
SIZE_V_IN = 3;
SIZE_H_IN = 3;
SIZE_X_IN = 3;
SIZE_W_IN = 3;
SIZE_R_IN = 3;
SIZE_P_IN = 3;
SIZE_S_IN = 3;

# Signals
K_IN = rand(SIZE_H_IN, SIZE_D_IN, SIZE_K_IN);
Q_IN = rand(SIZE_H_IN, SIZE_D_IN, SIZE_K_IN);
V_IN = rand(SIZE_H_IN, SIZE_D_IN, SIZE_V_IN);

W_OH_IN = rand(SIZE_H_IN*SIZE_V_IN, SIZE_D_IN);

W1_IN = rand(SIZE_M_IN, SIZE_D_IN);
B1_IN = rand(SIZE_M_IN, 1);

W2_IN = rand(SIZE_D_IN, SIZE_M_IN);
B2_IN = rand(SIZE_D_IN, 1);

W_I_IN = rand(SIZE_D_IN, SIZE_X_IN);
K_I_IN = rand(SIZE_R_IN, SIZE_D_IN, SIZE_W_IN);
V_I_IN = rand(SIZE_D_IN, SIZE_S_IN);
D_I_IN = rand(SIZE_R_IN, SIZE_D_IN, SIZE_P_IN);

X_I_IN = rand(SIZE_L_IN, SIZE_N_IN, SIZE_X_IN);
R_I_IN = rand(SIZE_L_IN, SIZE_N_IN, SIZE_R_IN, SIZE_W_IN);
XI_I_IN = rand(SIZE_L_IN, SIZE_N_IN, SIZE_S_IN);
RHO_I_IN = rand(SIZE_L_IN, SIZE_N_IN, SIZE_R_IN, SIZE_P_IN);

W_O_IN = rand(SIZE_D_IN, SIZE_X_IN);
K_O_IN = rand(SIZE_R_IN, SIZE_D_IN, SIZE_W_IN);
V_O_IN = rand(SIZE_D_IN, SIZE_S_IN);
D_O_IN = rand(SIZE_R_IN, SIZE_D_IN, SIZE_P_IN);

X_O_IN = rand(SIZE_L_IN, SIZE_N_IN, SIZE_X_IN);
R_O_IN = rand(SIZE_L_IN, SIZE_N_IN, SIZE_R_IN, SIZE_W_IN);
XI_O_IN = rand(SIZE_L_IN, SIZE_N_IN, SIZE_S_IN);
RHO_O_IN = rand(SIZE_L_IN, SIZE_N_IN, SIZE_R_IN, SIZE_P_IN);

PE_IN = rand(SIZE_L_IN, SIZE_N_IN, SIZE_D_IN);

# DUT
Z_OUT = ntm_controller(K_IN, Q_IN, V_IN, W_OH_IN, W1_IN, B1_IN, W2_IN, B2_IN, W_I_IN, K_I_IN, V_I_IN, D_I_IN, X_I_IN, R_I_IN, XI_I_IN, RHO_I_IN, W_O_IN, K_O_IN, V_O_IN, D_O_IN, X_O_IN, R_O_IN, XI_O_IN, RHO_O_IN, PE_IN);
