function varargout = ondaletas(varargin)
% ONDALETAS MATLAB code for ondaletas.fig
%      ONDALETAS, by itself, creates a new ONDALETAS or raises the existing
%      singleton*.
%
%      H = ONDALETAS returns the handle to a new ONDALETAS or the handle to
%      the existing singleton*.
%
%      ONDALETAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ONDALETAS.M with the given input arguments.
%
%      ONDALETAS('Property','Value',...) creates a new ONDALETAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ondaletas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ondaletas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ondaletas

% Last Modified by GUIDE v2.5 16-Nov-2017 16:54:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ondaletas_OpeningFcn, ...
                   'gui_OutputFcn',  @ondaletas_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ondaletas is made visible.
function ondaletas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ondaletas (see VARARGIN)

% Choose default command line output for ondaletas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ondaletas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ondaletas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in abrir.
function abrir_Callback(hObject, eventdata, handles)
% hObject    handle to abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global onda
global x

[filename, pathname] = uigetfile('*.txt*', 'Selecione o arquivo de texto');


if isequal(filename,0) 
   errordlg('Arquivo não encontrado','Erro');
   
else
 
   a = char(fullfile(pathname, filename));
     
   set(handles.endereco, 'String', a);
   
   onda = load([pathname filename]);
  
    x = onda;
   
   axes(handles.sinal)
   plot(x);
   
   grid on;
   
figure
plot(x)
xlabel('número de pontos')
ylabel('Tensão (mV)')
title('Sinal Bioelétrico')

figure
t = size(x,1);
t = (1:t)/200;
plot(t,x)
xlabel('tempo(s)')
ylabel('Tensão (mV)')
title('Sinal Bioelétrico')
end
   




% --- Executes on button press in freq_ok.
function freq_ok_Callback(hObject, eventdata, handles)
% hObject    handle to freq_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


Fa= str2num(get(handles.freq,'String'));


function freq_Callback(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq as text
%        str2double(get(hObject,'String')) returns contents of freq as a double


% --- Executes during object creation, after setting all properties.
function freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inicio_Callback(hObject, eventdata, handles)
% hObject    handle to inicio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inicio as text
%        str2double(get(hObject,'String')) returns contents of inicio as a double


% --- Executes during object creation, after setting all properties.
function inicio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inicio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in num_ok.
function num_ok_Callback(hObject, eventdata, handles)
% hObject    handle to num_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global onda
global x

num_inicio= get(handles.inicio,'String');
num_inicio = str2double(num_inicio);


num_fim= get(handles.fim,'String');
num_fim = str2double(num_fim);


if num_inicio == 0
    
    t = size(x,1);
    t = (1:t)/200;
        
    figure
    plot(t,x)
    xlabel('tempo(s)')
    ylabel('Tensão (mV)')
    title('Sinal Bioelétrico')
    
    set(handles.inicio, 'String', '1');
    set(handles.fim, 'String', t);
    
else
    x = x(num_inicio:num_fim,1);
    
    
    figure
    plot(x)
    title('Sinal Bioelétrico')
    ylabel('Tensão (mV)')
    xlabel('pontos')
    
    figure
    t = size(x,1);
    t = (1:t)/200;
        
    figure
    plot(t,x)
    xlabel('tempo(s)')
    ylabel('Tensão (mV)')
    title('Sinal Bioelétrico')
end
 

%Cn = complexidade(x); %complexidade do sinal
%fprintf('O valor de complexidade do sinal é %1.5f\n', Cn);

xm=mean(x); %media do sinal
fprintf('O valor da media do sinal é %3.5f\n', xm);

x2 = x.^2;
energia = sum(x2(:)); %energia do sinal
fprintf('O valor da energia do sinal é %3.5f\n', energia);

%set(handles.complexidade, 'String', Cn);
set(handles.mean, 'String', xm);
set(handles.energy, 'String', energia);



function fim_Callback(hObject, eventdata, handles)
% hObject    handle to fim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fim as text
%        str2double(get(hObject,'String')) returns contents of fim as a double


% --- Executes during object creation, after setting all properties.
function fim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num_dec_Callback(hObject, eventdata, handles)
% hObject    handle to num_dec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_dec as text
%        str2double(get(hObject,'String')) returns contents of num_dec as a double


% --- Executes during object creation, after setting all properties.
function num_dec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_dec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in tipo_w.
function tipo_w_Callback(hObject, eventdata, handles)
% hObject    handle to tipo_w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tipo_w contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tipo_w


% --- Executes during object creation, after setting all properties.
function tipo_w_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tipo_w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in onda_ok.
function onda_ok_Callback(hObject, eventdata, handles)
% hObject    handle to onda_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x
global sobre
global tipo_janela
global freq


str = get(handles.tipo_w, 'String'); %pega o tipo de ondaleta
val = get(handles.tipo_w,'Value');

dec = get(handles.num_dec, 'String'); %pega o numero de decomposições
dec = str2num(dec);

num_wav1 = get(handles.num_w, 'Value'); %pega o numero da ondaleta selecionada

num_wav = num2str(num_wav1);

freq =  get(handles.frequencia, 'String');
freq = str2num(freq);



% Set current data to the selected data set.

switch str{val};
case 'Haar' % User selects haar.
        
    [C,L] = wavedec(x ,dec,'haar');
    tipo = 'haar';
  
case 'Daubechies db' % User selects membrane.
    
    db = strcat('db', num_wav);
    [C,L] = wavedec(x ,dec, db);
    num_wav = char(num_wav);
    tipo = strcat('db', num_wav);
   
case 'Symlets' % User selects sinc.
     
    if num_wav1 <= 8
        
    db = strcat('sym', num_wav);
    [C,L] = wavedec(x ,dec, db);
    num_wav = char(num_wav);
    tipo = strcat('sym', num_wav);
  
    elseif num_wav > 8
        errordlg('Só existem 8 Symlets','Erro');
    end
    
   
case 'Coiflets' % User selects sinc.
    
    
    if num_wav1 <=5
    db = strcat('coif', num_wav);
    [C,L] = wavedec(x ,dec, db);
    num_wav = char(num_wav);
    tipo = strcat('coif', num_wav);
       
    else
       errordlg('Só existem 5 Coiflets','Erro');
    end
      
case 'DMeyer'
    [C,L] = wavedec(x ,dec,'dmey');
    tipo = 'dmey';
   
end
    y = get(handles.wel_onda, 'Value');
    t = get(handles.freq_ond, 'Value');
    
    n=0;
    a=1;
  

    
    if y == 1 && t==0
        str = get(handles.janelamento,'String');%pega o tipo de janela
val = get(handles.janelamento,'Value');

[l,b] = size(x);

switch str{val};
    
case 'Hamming' % User selects Hamming.
    janela  = hamming(l);
          
case 'Blackman' % User selects membrane.
     janela  = blackman(l);
           
case 'Flat top' % User selects sinc.
   janela  = flattopwin(l);
          
case 'Chebyshev' % User selects sinc.
    janela  = chebwin(l, 100);
             
case 'Gaussian'
     janela  = gausswin(l);
        
case 'Kayser'
    janela  = kaiser(l,2.5);
     
end
       while n < dec 
           n=n+1;
           
           %mudar
           Cd = detcoef(C,L,n);
           A = wrcoef('a',C,L,tipo,n); %mudar
           D = wrcoef('d',C,L,tipo,n); %mudar
           
           figure(1)
           subplot(dec,1,a); plot(A);  
           title('Approximation'); hold on; 
           Cna = complexidade(A)
           
           figure(2)
           
           subplot(dec,1,a)
           title('Welch Spectrum');
           B = A.*janela;
           [pxx,f] =  pwelch(B,tipo_janela, sobre , [] , freq);
           plot(f,10*log10(pxx))
           xlabel('Hz'); ylabel('dB');
           grid on; hold on;
           
           figure(3)
           subplot(dec,1,a); plot(D); 
           title('Detail'); hold on; 
           Cnb = complexidade(D)
           
  
           figure(4)
           subplot(dec,1,a)
           title('Welch Spectrum');
           C = D.*janela;
           [pxx,f] =  pwelch(C,tipo_janela, sobre , [] , freq);
           plot(f,10*log10(pxx))
           xlabel('Hz'); ylabel('dB');
           grid on; hold on;
           
           
           a = a +1 ;
       
       end
       
    elseif y == 0 && t==0
       
         while n < dec 
           n=n+1;
           
           Cd = detcoef(C,L,n);
           A = wrcoef('a',C,L,tipo,n); %mudar
           D = wrcoef('d',C,L,tipo,n); %mudar
           
           figure(1)
           subplot(dec,1,a); plot(A);  
           title('Approximation'); hold on; 
           Cna = complexidade(A)
           
                     
           figure(2)
           subplot(dec,1,a); plot(D); 
           title('Detail'); hold on; 
           Cnb = complexidade(D)
                      
           
           a = a +1 ;
         end
     
     
    
    elseif t == 1 && y==0
                  
           figure           
           title('Wavelet Spectrum');
           level = dec;
           wpt = wpdec(x,level,tipo);
          [S,T,F] = wpspectrum(wpt,freq,'plot');
           hold on;
           
         
   
    end


% --- Executes on slider movement.
function num_w_Callback(hObject, eventdata, handles)
% hObject    handle to num_w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


num_wav = get(hObject, 'Value'); %pega o numero da ondaleta selecionada
num_wav = num2str(num_wav);
set(handles.edit6,'String',num_wav);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function num_w_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x 
global onda



x = onda;
axes(handles.sinal)

figure
plot(x)



% --- Executes on button press in salvar.
function salvar_Callback(hObject, eventdata, handles)
% hObject    handle to salvar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in denoise.
function denoise_Callback(hObject, eventdata, handles)
% hObject    handle to denoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x

str = get(handles.tipo_w, 'String'); %pega o tipo de ondaleta
val = get(handles.tipo_w,'Value');

num_wav = get(handles.num_w, 'Value'); %pega o numero da ondaleta selecionada
num_wav = num2str(num_wav);

dec = get(handles.num_dec, 'String'); %pega o numero de decomposições
dec = str2num(dec);

switch str{val};
case 'Haar' % User selects haar.
    c = 'haar';
    [C,L] = wavedec(x ,dec, c);
    
case 'Daubechies db' % User selects membrane.
    c = strcat('db', num_wav);
    [C,L] = wavedec(x ,dec, c);
   
case 'Symlets' % User selects sinc.
    c = strcat('sym', num_wav);
    [C,L] = wavedec(x ,dec, c);
       
case 'Coiflets' % User selects sinc.
    c = strcat('coif', num_wav);
    [C,L] = wavedec(x ,dec, c);
          
case 'DMeyer'
    c = 'dmey';
    [C,L] = wavedec(x ,dec, c);
    
end



[thr,sorh,keepapp] = ddencmp('den','wv',x); 
x = wdencmp('gbl',C,L,c,dec,thr,sorh,keepapp);

% axes(handles.denoised)
% plot(x); title('denoised')
t = size(x,1);
t = (1:t)/200;

figure
plot(t,x); 
title('Sinal Filtrado')
xlabel('tempo(s)')
ylabel('Tensão (mV)')
    

% Cn = complexidade(x); %complexidade do sinal
% fprintf('O valor de complexidade do sinal é %1.5f\n', Cn);
% 
% set(handles.cn2, 'String', Cn);


% --- Executes during object creation, after setting all properties.
function complexidade_CreateFcn(hObject, eventdata, handles)
% hObject    handle to complexidade (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in wel_onda.
function wel_onda_Callback(hObject, eventdata, handles)
% hObject    handle to wel_onda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of wel_onda


% --- Executes on selection change in estimativa.
function estimativa_Callback(hObject, eventdata, handles)
% hObject    handle to estimativa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns estimativa contents as cell array
%        contents{get(hObject,'Value')} returns selected item from estimativa


% --- Executes during object creation, after setting all properties.
function estimativa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to estimativa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in sobreposicao.
function sobreposicao_Callback(hObject, eventdata, handles)
% hObject    handle to sobreposicao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
global sobre
global a

str = get(handles.sobreposicao, 'String'); 
val = get(handles.sobreposicao,'Value');

[a,b] = size(x);

switch str{val};
    
case '25%' % User selects Hamming.
    sobre  = floor(a/4);
       
case '50%' % User selects Hamming.
    sobre  = floor(a/2);
       
case '75%' % User selects Hamming.
    sobre  = floor((3*a)/4);
      
end
    
    

% --- Executes during object creation, after setting all properties.
function sobreposicao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sobreposicao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in ok_welch.
function ok_welch_Callback(hObject, eventdata, handles)
% hObject    handle to ok_welch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x
global sobre
global tipo_janela
global freq


freq =  get(handles.frequencia, 'String');
freq = str2num(freq);

figure

y = get(handles.confia, 'Value');

    
if y == 1
    [pxx,f, pxxc] =  pwelch(x,tipo_janela, sobre , [] , freq,  ...
    'ConfidenceLevel',0.95);
plot(f,20*log10(pxx)); hold on;
plot(f,20*log10(pxxc),'r--','linewidth',2);
% axis([25 250 min(min(10*log10(pxxc))) max(max(10*log10(pxxc)))]);
xlabel('Hz'); ylabel('dB');
title('Welch Estimate with 95%-Confidence Bounds');
         
elseif y ==0
    
    [pxx,f] =  pwelch(x,tipo_janela, sobre , [] , freq);
     plot(f,20*log10(pxx))
     xlabel('Hz'); ylabel('dB');
     title('Welch Estimate')
     grid on;
     
end
         
    


function frequencia_Callback(hObject, eventdata, handles)
% hObject    handle to frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frequencia as text
%        str2double(get(hObject,'String')) returns contents of frequencia as a double


% --- Executes during object creation, after setting all properties.
function frequencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in confia.
function confia_Callback(hObject, eventdata, handles)
% hObject    handle to confia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of confia


% --- Executes on selection change in janela.
function janela_Callback(hObject, eventdata, handles)
% hObject    handle to janela (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns janela contents as cell array
%        contents{get(hObject,'Value')} returns selected item from janela
global tipo_janela
global a

str = get(handles.janela,'String');%pega o tipo de ondaleta
val = get(handles.janela,'Value');



switch str{val};
    
case 'Hamming' % User selects Hamming.
    tipo_janela  = hamming(a);
       
case 'Blackman' % User selects membrane.
     tipo_janela  = blackman(a);
     
case 'Flat top' % User selects sinc.
   tipo_janela  = flattopwin(a);
       
case 'Chebyshev' % User selects sinc.
    tipo_janela  = chebwin(a, 100);
          
case 'Gaussian'
    tipo_janela  = gausswin(a);
    
case 'Kayser'
    tipo_janela  = kaiser(a,2.5);
  
    
end


% --- Executes during object creation, after setting all properties.
function janela_CreateFcn(hObject, eventdata, handles)
% hObject    handle to janela (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ok_espectro.
function ok_espectro_Callback(hObject, eventdata, handles)
% hObject    handle to ok_espectro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
global tipo_janela
global sobre

freq =  get(handles.frequencia, 'String');
freq = str2double(freq);


[pxx,f] =  spectrogram(x,tipo_janela, sobre , [] , freq);

figure
spectrogram(x,tipo_janela, sobre , [] , freq,'yaxis')
title('Espectrograma')

figure
 plot(f,20*log10(pxx))
     xlabel('Hz'); ylabel('dB');
     grid on;
     


% --- Executes on button press in ok_periodo.
function ok_periodo_Callback(hObject, eventdata, handles)
% hObject    handle to ok_periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
global tipo_janela

freq =  get(handles.frequencia, 'String');
freq = str2double(freq);

[pxx,f] =  periodogram(x,tipo_janela,  [] , freq);
figure
 plot(f,20*log10(pxx))
     xlabel('Hz'); ylabel('dB');
     grid on;
     


% --- Executes on button press in denoise.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to denoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in janelamento_ok.
function janelamento_ok_Callback(hObject, eventdata, handles)
% hObject    handle to janelamento_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global x


str = get(handles.janelamento,'String');%pega o tipo de janela
val = get(handles.janelamento,'Value');

[a,b] = size(x);

switch str{val};
    
case 'Hamming' % User selects Hamming.
    janela  = hamming(a);
    axes(handles.sinal)
    x = x.*janela;
    plot(x);
       
case 'Blackman' % User selects membrane.
     janela  = blackman(a);
      axes(handles.sinal)
      x = x.*janela;
    plot(x);
     
case 'Flat top' % User selects sinc.
   janela  = flattopwin(a);
    axes(handles.sinal)
    x = x.*janela;
    plot(x);
       
case 'Chebyshev' % User selects sinc.
    janela  = chebwin(a, 100);
     axes(handles.sinal)
     x = x.*janela;
    plot(x);
          
case 'Gaussian'
     janela  = gausswin(a);
     axes(handles.sinal)
    x = x.*janela;
    plot(x);
    
case 'Kayser'
    janela  = kaiser(a,2.5);
    axes(handles.sinal)
    x = x.*janela;
    plot(x);
  
    
end


Cn = complexidade(x); %complexidade do sinal

xm=mean(x); %media do sinal

x2 = x.^2;
energia = sum(x2(:)); %energia do sinal

set(handles.complexidade, 'String', Cn);
set(handles.mean, 'String', xm);
set(handles.energy, 'String', energia);


% --- Executes on selection change in janelamento.
function janelamento_Callback(hObject, eventdata, handles)
% hObject    handle to janelamento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns janelamento contents as cell array
%        contents{get(hObject,'Value')} returns selected item from janelamento


% --- Executes during object creation, after setting all properties.
function janelamento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to janelamento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in freq_ond.
function freq_ond_Callback(hObject, eventdata, handles)
% hObject    handle to freq_ond (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of freq_ond
