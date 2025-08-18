# freertos_s32k312_clion

A FreeRTOS-based NXP S32K312 project with CMake support, ready to build and debug in CLion. Supports JLink and pyOCD, including DAPLink wireless flashing and debugging, as well as serial communication. Use CLion to open the project and start debugging with the preconfigured run/debug settings.  

���� FreeRTOS �� NXP S32K312 ��Ŀ���ṩ CMake ֧�֣����� CLion ��ֱ�ӹ����͵��ԡ�֧�� JLink �� pyOCD������ pyOCD ֧�� DAPLink ������������ԣ����ɽ��д���ͨ�š�ʹ�� CLion ������Ŀ���ɣ����е���������Ԥ��á�

## Features / ����

- FreeRTOS + S32K312 base project / FreeRTOS + S32K312 ��������
- CMake support, open directly in CLion / CMake ֧�֣���ֱ���� CLion ��
- JLink flash and debug / JLink ����������
- pyOCD flash and debug / pyOCD ����������
- DAPLink wireless flashing and debugging / DAPLink �������������
- Serial communication support / ����ͨ��֧��
- Independent of S32DS, fully CLion-based / ���� S32DS����ȫ���� CLion

## pyOCD Notice / pyOCD ע������

The latest official version of pyOCD has compatibility issues with S32K312. Please use the temporary branch instead:

���¹ٷ��汾�� pyOCD �� S32K312 ���ڼ��������⣬��ʹ��������ʱ��֧��

```bash
git clone https://github.com/narfa0215/pyOCD -b s32k312_v0.35.1
cd pyOCD
pip install .
```

## License / ���֤

MIT License / MIT License

## Acknowledgements / ��л

- NXP S32K312 + FreeRTOS base project / NXP S32K312 + FreeRTOS ��������
- CLion CMake support / CLion CMake ֧��
- JLink & pyOCD open-source debug tools / JLink & pyOCD ��Դ���Թ���
- DAPLink wireless flashing and debugging capability / DAPLink �ṩ��������д���������
- Inspired by [freertos_s32k144evb_cmake](https://github.com/ShiboJiang/freertos_s32k144evb_cmake) / �ο��� [freertos_s32k144evb_cmake](https://github.com/ShiboJiang/freertos_s32k144evb_cmake)  
