clear all

the_camera = webcam;
the_network = googlenet;
required_input_size = the_network.Layers(1).InputSize(1:2)
while true
    
    single_Image = the_camera.snapshot;
    single_Image = imresize(single_Image, required_input_size);
    
    [predicted_item, probability] = classify(the_network,single_Image);
    image(single_Image);
    title({char(predicted_item), num2str(max(probability),2)});
    drawnow;
end

